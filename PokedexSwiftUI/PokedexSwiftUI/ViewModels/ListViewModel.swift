//
//  ListViewModel.swift
//  PokedexSwiftUI
//
//  Created by Oguz Demırhan on 24.04.2021.
//

import Foundation


class ListViewModel : ObservableObject {
    
    @Published var pokeResults = [PokeResults]()
    var next = Constants.basePokemonURL
    
    func fetchPokemonList() {
        
        guard let apiURL = URL(string: next) else {return}
        
        let task = URLSession.shared.dataTask(with: apiURL) { (data, resp, err) in
            guard let data = data else {return}
            
            do {
                let decoder = try JSONDecoder().decode(ListModel.self, from: data)
                DispatchQueue.main.async {
                    self.pokeResults.append(contentsOf: decoder.results) 
                    self.next = decoder.next
                }
            }
            catch(let error) {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
