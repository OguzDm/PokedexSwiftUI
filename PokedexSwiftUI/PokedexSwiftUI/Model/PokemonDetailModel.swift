//
//  PokemonDetailModel.swift
//  PokedexSwiftUI
//
//  Created by Oguz Demırhan on 26.04.2021.
//

import Foundation


struct PokemonDetailModel : Codable {
    let name : String
    let sprites : Sprites
    let types : [Types]
    let stats : [Stats]
}
