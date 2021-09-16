//
//  WhoIsThatPokemonViewModel.swift
//  PokedexSwiftUI
//
//  Created by Oguz Demırhan on 27.04.2021.
//

import Foundation


class WhoIsThatPokemonViewModel : ObservableObject{
    
    @Published var name = ""
    @Published var sprite = ""
    
    let baseURL = "https://pokeapi.co/api/v2/pokemon/"
    
    init() {
        fetchData()
    }
    
    func fetchData () {
        let pokemonURL = baseURL+"\(Int.random(in: 1...200))/"
        guard let url = URL(string: pokemonURL) else {return}
        let task = URLSession.shared.dataTask(with: url) { (data, resp, err) in
            
            guard let data = data else {return}
            do {
                let decoder = try JSONDecoder().decode(PokemonModel.self, from: data)
                
                DispatchQueue.main.async {
                    self.name = decoder.name
                    self.sprite = decoder.sprites.other.officialArtwork.front_default
                }
            }
            catch(let error){
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
