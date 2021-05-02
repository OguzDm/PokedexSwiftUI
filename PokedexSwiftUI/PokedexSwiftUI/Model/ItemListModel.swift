//
//  ItemListModel.swift
//  PokedexSwiftUI
//
//  Created by Oguz Demırhan on 25.04.2021.
//

import Foundation


struct ItemListModel : Codable {
    
    
    let results: [ItemResults]
    
}

struct ItemResults: Codable ,Hashable{
    let name: String
}
