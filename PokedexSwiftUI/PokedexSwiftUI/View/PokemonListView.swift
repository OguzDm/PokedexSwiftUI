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
           
           if listViewModel.pokeResults.count > 20 {
                   
                       
                       ScrollView(.vertical){
                           LazyVGrid(columns: gridItems) {
                               ForEach(listViewModel.pokeResults,id:\.self) { poke in

                                   PokemonCell(name: poke.name)
                                


                               }


                           }
                       }
                       
                      
               
                   
             
                
                 
               }
        
           else {
            PokeballLoadingView()
           }
               
               
          
        
        
           
       }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}
