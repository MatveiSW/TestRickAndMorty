//
//  CharactersViewModel.swift
//  TestRickAndMorty
//
//  Created by Матвей Авдеев on 08.07.2024.
//

import Foundation

final class CharacterViewModel {
        
    func getCharacters(completion: @escaping (Characters?) -> Void) {
        NetworkManager.shared.networkRequest(Characters.self, url: Links.characters.url) { result in
            switch result {
            case .success(let data):
                completion(data)
            case .failure(let error):
                AlertManager().showAlert(style: .alert, title: "red", message: error.message)
            }
        }
    }

}
