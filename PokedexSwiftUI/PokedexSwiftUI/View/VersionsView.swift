//
//  VersionsView.swift
//  PokedexSwiftUI
//
//  Created by Oguz Demırhan on 23.04.2021.
//

import SwiftUI

struct VersionsView: View {
    
    private let gridItems = [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]
    var image: String?
    var name: String
    @StateObject var versionsViewModel = VersionsViewModel()
    var body: some View {
        
        if versionsViewModel.spritesArray.count > 2 {
            
            VStack{
                
            
            ScrollView(.vertical){
                LazyVGrid(columns:gridItems) {
                    
                    ForEach(versionsViewModel.spritesArray, id: \.self) { sprite in
                        PokeImageCell(image: sprite)
                    }
                    
                }
                    
                
                .onAppear{
                    versionsViewModel.update(name: name)
                }
                    
                
                
                
                
                }
            }
            .frame(width: 350, height: 250, alignment: .center)
        }
        
        else {
            
            PokeballLoadingView()
        }
        

    }
}

struct VersionsView_Previews: PreviewProvider {
    static var previews: some View {
        VersionsView(image: "Charmander", name: "charmander")
    }
}
