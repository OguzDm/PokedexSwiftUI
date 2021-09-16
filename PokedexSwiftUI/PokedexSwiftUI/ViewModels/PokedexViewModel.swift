//
//  PokedexViewModel.swift
//  PokedexSwiftUI
//
//  Created by Oguz Demırhan on 23.04.2021.
//

import Foundation
import SwiftUI


class PokedexViewModel : ObservableObject {
    
    @Published var name = ""
    @Published var spriteArray = ""
    @Published var typeArray = ""
    @Published var statArray = [Stats]()
    
    let baseURL = "https://pokeapi.co/api/v2/pokemon/"
    
    func fetchData (pokemonName: String) {
        let pokemonURL = baseURL+"\(pokemonName)/"
        guard let url = URL(string: pokemonURL) else {return}
        let task = URLSession.shared.dataTask(with: url) { (data, resp, err) in
            
            guard let data = data else {return}
            do {
                let decoder = try JSONDecoder().decode(PokemonModel.self, from: data)
                DispatchQueue.main.async {
                    self.name = decoder.name
                    self.spriteArray = decoder.sprites.other.officialArtwork.front_default
                    self.typeArray = decoder.types[0].type.name
                    self.statArray = decoder.stats
                    
                }
            }
            catch{
                
            }
        }
        task.resume()
    }
    
    func update(name: String) {
        fetchData(pokemonName: name)
    }
}
