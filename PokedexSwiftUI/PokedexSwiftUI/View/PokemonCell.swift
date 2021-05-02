//
//  PokemonCell.swift
//  PokedexSwiftUI
//
//  Created by Oguz Demırhan on 23.04.2021.
//

import SwiftUI
import Kingfisher

struct PokemonCell: View {
    
    var name: String
    
    @StateObject var pokedexViewModel = PokedexViewModel()
    @State private var showingSheet = false
    var body: some View {
        
        if pokedexViewModel.spriteArray != "" {
            
      
        
            ZStack{
                
          
                Button(action: {
                    showingSheet.toggle()
                }){
                    VStack{
                        KFImage(URL(string: pokedexViewModel.spriteArray ))
                            .resizable()
                            .frame(width: 100, height: 100, alignment: .center).padding()
                        
                        
                        
                        Text(pokedexViewModel.name.capitalized(with: .current))
                            .foregroundColor(.white)
                        
                    

                    }
                }
                .sheet(isPresented: $showingSheet) {
                    PokemonPageView(pokemonName: pokedexViewModel.name)
                }

           
                
                
            }.frame(width: 180, height: 200, alignment: .center)
            .background(LinearGradient(gradient: Gradient(colors: [returnColorFromType(type: pokedexViewModel.typeArray ), returnColorFromType(type: pokedexViewModel.typeArray ).opacity(0.2)]), startPoint: .leading, endPoint: .bottomTrailing))
            .shadow(color: returnColorFromType(type: pokedexViewModel.typeArray ), radius: 8.0, x: 0.0, y: 0.0)
            .cornerRadius(8.0)
        
        
        
        
        }
        
        else {
            
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle())
            .onAppear{
                pokedexViewModel.update(name: name)
            }
        
        }
       
      
    }
    
    
    func returnColorFromType(type: String) -> Color {
        
        switch type {
        case "normal":
            return Color(UIColor.lightGray)
        case "fighting":
            return Color.orange
        case "flying":
            return Color.blue
        case "poison":
            return Color.green
        case "ground":
            return Color(UIColor.brown)
        case "rock":
            return Color(UIColor.darkGray)
        case "bug":
            return Color(UIColor.systemIndigo)
        case "ghost":
            return Color(UIColor.lightText)
        case "steel":
            return Color(UIColor.systemGray3)
        case "fire":
            return Color.red
        case "water":
            return Color(UIColor.systemTeal)
        case "grass":
            return Color(UIColor.systemGreen)
        case "electric":
            return Color(UIColor.systemYellow)
        case "psychic":
            return Color.yellow
        case "ice":
            return Color(UIColor.systemTeal)
        case "dragon":
            return Color(UIColor.systemRed)
        case "dark":
            return Color.black
        case "fairy":
            return Color.pink
        case "unknown":
            return Color.white
        case "shadow":
            return Color.purple
        default:
            return Color.pink
        }
    }
}

struct PokemonCell_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCell(name: "charmander")
            .preferredColorScheme(.dark)
    }
}
