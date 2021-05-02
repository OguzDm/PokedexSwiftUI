//
//  ListViewModel.swift
//  PokedexSwiftUI
//
//  Created by Oguz Demırhan on 24.04.2021.
//

import Foundation


class ListViewModel : ObservableObject {
    
    let baseURL = "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=200"
    
    @Published var pokeResults = [PokeResults]()
    
    
    
    init() {
        fetchPokemonList()
    }
    func fetchPokemonList() {
        
        let apiURL = URL(string: baseURL)!
        
        let task = URLSession.shared.dataTask(with: apiURL) { (data, resp, err) in
            guard let data = data else {return}
            
            do {
                
                let decoder = try JSONDecoder().decode(ListModel.self, from: data)
                DispatchQueue.main.async {
                    self.pokeResults = decoder.results
                    
                    print(decoder.results[0].name)
                    print(decoder.results[1].name)
                    print(decoder.results[2].name)
                    print(decoder.results[3].name)
                    print(decoder.results[4].name)
                }
          


            }
            
            catch {
                
            }
        }
        task.resume()
    }
    
    
}
