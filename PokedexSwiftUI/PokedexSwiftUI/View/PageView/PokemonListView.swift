//
//  PokemonListView.swift
//  PokedexSwiftUI
//
//  Created by Oguz Demırhan on 25.04.2021.
//

import SwiftUI

struct PokemonListView: View {
    private let gridItems = [GridItem(.flexible()),GridItem(.flexible())]
    
    @StateObject var listViewModel = ListViewModel()
    var body: some View {
        
        if !listViewModel.pokeResults.isEmpty {
            ScrollView(.vertical){
                LazyVGrid(columns: gridItems) {
                    ForEach(listViewModel.pokeResults.indices,id:\.self) { index in
                        PokemonCell(name: listViewModel.pokeResults[index].name)
                            .onAppear {
                                if index == listViewModel.pokeResults.count - 4 {
                                    listViewModel.fetchPokemonList()
                            }
                        }
                    }
                }
            }
        }
        else {
            PokeballLoadingView()
                .onAppear {
                    listViewModel.fetchPokemonList()
            }
        }
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}
