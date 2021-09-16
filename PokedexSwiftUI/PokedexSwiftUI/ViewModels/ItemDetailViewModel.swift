//
//  ItemDetailViewModel.swift
//  PokedexSwiftUI
//
//  Created by Oguz Demırhan on 25.04.2021.
//

import Foundation


class ItemDetailViewModel : ObservableObject {
    
    @Published var itemSprite = ""
    
    func fetchDataForSprite (itemName: String) {
        let itemURL = "https://pokeapi.co/api/v2/item/\(itemName)"
        guard let url = URL(string: itemURL) else {return}
        let task = URLSession.shared.dataTask(with: url) { (data, resp, err) in
            
            guard let data = data else {return}
            do {
                let decoder = try JSONDecoder().decode(ItemModel.self, from: data)
                DispatchQueue.main.async {
                    self.itemSprite = decoder.sprites.spritesDefault
                }
            }
            catch(let error){
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    func uploadSprite(itemName: String) {
        fetchDataForSprite(itemName: itemName)
    }
}
