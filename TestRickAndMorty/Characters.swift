//
//  Characters.swift
//  TestRickAndMorty
//
//  Created by Матвей Авдеев on 08.07.2024.
//

import Foundation

struct Characters: Decodable {
            
    let info: Info?
    let results: [Results]?
    
    struct Info: Decodable {
        let count: Int?
        let pages: Int?
        let next: String?
        let prev: String?
    }
    
    struct Results: Decodable {
        let id: Int?
        let name: String?
        let status: String?
        let species: String?
        let type: String?
        let gender: String?
        let origin: Origin?
        let location: Location?
        let image: String?
        
        struct Origin: Decodable {
            let name: String?
            let url: String?
        }
        
        struct Location: Decodable {
            let name: String?
            let url: String?
        }
    }
}
