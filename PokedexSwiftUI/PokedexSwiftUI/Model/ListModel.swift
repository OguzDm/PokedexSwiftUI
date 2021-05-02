//
//  ListModel.swift
//  PokedexSwiftUI
//
//  Created by Oguz Demırhan on 24.04.2021.
//

import Foundation


struct ListModel : Codable{
    
    let next: String
    let results: [PokeResults]
}

struct PokeResults: Codable,Hashable{
    
    
    let name: String
    let url: String
}
