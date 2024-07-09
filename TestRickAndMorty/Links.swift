//
//  Links.swift
//  TestRickAndMorty
//
//  Created by Матвей Авдеев on 08.07.2024.
//

import Foundation

enum Links {
    case characters
    var url: URL {
        switch self {
        case .characters:
            return URL(string: "https://rickandmortyapi.com/api/character")!
        }
    }
}
