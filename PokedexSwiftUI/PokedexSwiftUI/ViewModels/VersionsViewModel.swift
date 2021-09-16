//
//  VersionsViewModel.swift
//  PokedexSwiftUI
//
//  Created by Oguz Demırhan on 23.04.2021.
//

import Foundation


class VersionsViewModel: ObservableObject {
    
    let baseURL = "https://pokeapi.co/api/v2/pokemon/"
    var tempSpritesArray = [String]()
    
    @Published var spritesArray = [String]()
    @Published var name = ""
    
    init(pokemonName: String? = nil) {
        
        if let pokemonName = pokemonName {
            fetchData(pokemonName: pokemonName)
        }
        else {
            fetchData(pokemonName: "charmander")
        }
    }
    
    func fetchData (pokemonName: String) {
        let pokemonURL = baseURL+"\(pokemonName)/"
        guard let url = URL(string: pokemonURL) else {return}
        let task = URLSession.shared.dataTask(with: url) { (data, resp, err) in
            
            guard let data = data else {return}
            do {
                let decoder = try JSONDecoder().decode(VersionsModel.self, from: data)
                DispatchQueue.main.async {
                    
                    self.tempSpritesArray.append(decoder.sprites.frontDefault)
                    self.tempSpritesArray.append(decoder.sprites.versions?.generationI.redBlue.frontDefault ?? decoder.sprites.backDefault)
                    self.tempSpritesArray.append(decoder.sprites.versions?.generationIi.crystal.frontDefault ?? decoder.sprites.backShiny)
                    self.tempSpritesArray.append(decoder.sprites.versions?.generationIii.emerald.frontDefault ?? "")
                    self.tempSpritesArray.append(decoder.sprites.versions?.generationIv.diamondPearl.frontDefault ?? "")
                    self.tempSpritesArray.append(decoder.sprites.versions?.generationViii.icons.frontDefault ?? "")
                    self.tempSpritesArray.append(decoder.sprites.versions?.generationIi.gold.frontDefault ?? "")
                    self.tempSpritesArray.append(decoder.sprites.versions?.generationVii.icons.frontDefault ?? "")
                    self.tempSpritesArray.append(decoder.sprites.versions?.generationV.blackWhite.animated?.frontDefault ?? "")
                    self.tempSpritesArray.append(decoder.sprites.versions?.generationIv.heartgoldSoulsilver.frontDefault ?? "")
                    self.tempSpritesArray.append(decoder.sprites.versions?.generationIi.silver.frontDefault ?? "")
                    self.tempSpritesArray.append(decoder.sprites.versions?.generationIii.rubySapphire.frontDefault ?? "")
                    
                    self.spritesArray = self.tempSpritesArray
        
                    self.tempSpritesArray.removeAll()
                    
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
