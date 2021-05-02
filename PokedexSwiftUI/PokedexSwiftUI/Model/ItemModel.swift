//
//  ItemModel.swift
//  PokedexSwiftUI
//
//  Created by Oguz Demırhan on 25.04.2021.
//

import Foundation


struct ItemModel:Codable {
    let sprites: ItemSprite
}

struct ItemSprite: Codable {
    let spritesDefault: String

    enum CodingKeys: String, CodingKey {
        case spritesDefault = "default"
    }
}
