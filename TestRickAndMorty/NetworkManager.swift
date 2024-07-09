//
//  NetworkManager.swift
//  TestRickAndMorty
//
//  Created by Матвей Авдеев on 08.07.2024.
//

import UIKit
import Kingfisher

enum NetworkError: Error {
    case serverError
    case dataError
    
    var message: String {
        switch self {
        case .dataError: return "Ошибка данных"
        case .serverError: return "Ошибка сервера"
        }
    }
}

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    private lazy var session: URLSession = {
        
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 15
        configuration.timeoutIntervalForResource = 15
        let session = URLSession(configuration: configuration)
        return session
    }()
    
    private lazy var decoder: JSONDecoder = {
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()
    
    func networkRequest<T: Decodable>(_ type: T.Type, url: URL, completion: @escaping (Result<T, NetworkError>) -> Void) {
        
        let urlRequest = url
        
        if session.configuration.timeoutIntervalForRequest > 15 || session.configuration.timeoutIntervalForResource > 15 {
            DispatchQueue.main.async {
                completion(.failure(.serverError))
            }
        }
        
        session.dataTask(with: urlRequest) { [weak self] data, response, error in
            guard let self = self else { return }
            if error != nil {
                DispatchQueue.main.async {
                    completion(.failure(.serverError))
                }
                return
            }
            guard let httpResponse = response as? HTTPURLResponse, (200...500).contains(httpResponse.statusCode) else {
                DispatchQueue.main.async {
                    completion(.failure(.serverError))
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(.failure(.serverError))
                }
                return
            }
            
            do {
                let resultData = try decoder.decode(type, from: data)
                DispatchQueue.main.async {
                    completion(.success(resultData))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(.dataError))
                }
            }
        }.resume()
        
    }
    
    func fetchImage(url: URL, image: UIImageView) {
        image.kf.setImage(with: url)
    }
    
}
