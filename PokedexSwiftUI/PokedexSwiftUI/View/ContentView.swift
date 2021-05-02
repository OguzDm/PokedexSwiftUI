//
//  ContentView.swift
//  PokedexSwiftUI
//
//  Created by Oguz Demırhan on 23.04.2021.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
 
    var body: some View {
        TabView {
            PokemonListView()
                .tabItem {
                    Label("Pokemons", systemImage: "list.dash")
                }

            NavigationView {ItemListView()}
                .tabItem {
                    Label("Items", systemImage: "circle.grid.3x3")
                }
            
            WhoIsThatPokemonView()
                .tabItem {
                    Label("Who?",systemImage: "gamecontroller")
                }
        }
        .accentColor(Color.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
