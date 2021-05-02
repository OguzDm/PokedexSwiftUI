//
//  PokemonModel.swift
//  PokedexSwiftUI
//
//  Created by Oguz Demırhan on 23.04.2021.
//

import Foundation


struct PokemonModel : Codable {
    let name : String
    let sprites : Sprites
    let types : [Types]
    let stats : [Stats]
    
}
struct Sprites : Codable {
    let back_default: String
    let front_default: String
    let other: Other
}

struct Types : Codable {
    let type: Type
}

struct Type: Codable {
    let name: String
}

struct Other : Codable {
    let officialArtwork: OfficialArtwork
    
    enum CodingKeys: String, CodingKey {
        case officialArtwork = "official-artwork"
    }
}

struct OfficialArtwork: Codable {
    
    let front_default: String
}

struct Stats: Codable {
    
    let base_stat: Int
    let stat: PokemonStat
    
}

struct PokemonStat : Codable {
    
    let name: String
}
