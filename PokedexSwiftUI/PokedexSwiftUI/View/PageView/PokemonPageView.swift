//
//  PokemonPageView.swift
//  PokedexSwiftUI
//
//  Created by Oguz Demırhan on 23.04.2021.
//

import SwiftUI
import Kingfisher

struct PokemonPageView: View {
    
    private let gridItems = [GridItem(.flexible())]
    let pokemonName: String
    @State private var selectedPage = 1
    @StateObject var pokedexViewModel = PokemonDetailViewModel()
    
    var body: some View {
        if pokedexViewModel.typeArray.count > 0 {
            VStack{
                VStack{
                    Text(pokedexViewModel.name.capitalized(with: .current))
                        .frame(width: 200, height: 50, alignment: .center)
                        .foregroundColor(.white)
                        .font(.system(size:30))
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.white.opacity(0.30))
                        )
                        .frame(width: 200, height: 50, alignment: .bottom)
                    
                    KFImage(URL(string: pokedexViewModel.spriteArray ))
                        .resizable()
                        .frame(width: 200, height: 200, alignment: .top)
                }
                .frame(width: UIScreen.main.bounds.width - 50, height: 275, alignment: .bottom)
                
                .background(returnColorFromType(type: pokedexViewModel.typeArray[0].type.name ))
                .cornerRadius(40)
                .padding(.top,50)
                .ignoresSafeArea()
                
                
                
                VStack {
                    
                    HStack{
                        
                        if pokedexViewModel.typeArray.count == 1 {
                            
                            HStack{
                                Text(pokedexViewModel.typeArray[0].type.name.capitalized(with: .current))
                                
                                Image(systemName: returnImageFromType(type: pokedexViewModel.typeArray[0].type.name))
                                    .font(.system(size: 80))
                                    .padding(.trailing, -60)
                                    .opacity(0.3)
                            }
                            .frame(width: 150, height: 50, alignment: .center)
                            .foregroundColor(.white)
                            .font(.system(size:22))
                            .background(returnColorFromType(type: pokedexViewModel.typeArray[0].type.name ).opacity(0.40))
                            .cornerRadius(16)
                            
                        }
                        
                        else if pokedexViewModel.typeArray.count == 2 {
                            
                            HStack{
                                Text(pokedexViewModel.typeArray[0].type.name.capitalized(with: .current))
                                
                                Image(systemName: returnImageFromType(type: pokedexViewModel.typeArray[0].type.name))
                                    .font(.system(size: 80))
                                    .padding(.trailing, -60)
                                    .opacity(0.3)
                            }
                            .frame(width: 150, height: 50, alignment: .center)
                            .foregroundColor(.white)
                            .font(.system(size:28))
                            .background(returnColorFromType(type: pokedexViewModel.typeArray[0].type.name ).opacity(0.40))
                            .cornerRadius(16)
                            
                            
                            HStack{
                                Text(pokedexViewModel.typeArray[1].type.name.capitalized(with: .current))
                                
                                Image(systemName: returnImageFromType(type: pokedexViewModel.typeArray[1].type.name))
                                    .font(.system(size: 80))
                                    .padding(.trailing, -60)
                                    .opacity(0.3)
                            }
                            .frame(width: 150, height: 50, alignment: .center)
                            .foregroundColor(.white)
                            .font(.system(size:28))
                            .background(returnColorFromType(type: pokedexViewModel.typeArray[1].type.name ).opacity(0.40))
                            .cornerRadius(16)
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width, height: 50, alignment: .top)
                    .padding(.bottom,30)
                    
                    StatsCell(stats: pokedexViewModel.statArray)
                    
                }
                
                .frame(width: UIScreen.main.bounds.width - 50, height: 470 , alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                .background(returnColorFromType(type:pokedexViewModel.typeArray[0].type.name).opacity(0.62))
                .cornerRadius(40)
                .padding(.top,30)
                
                
                
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .top)
            .background(returnColorFromType(type:pokedexViewModel.typeArray[0].type.name).opacity(0.20))
            
            
        }
        else {
            PokeballLoadingView()
                
                .onAppear{
                    pokedexViewModel.update(name: pokemonName)
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
    
    
    func returnImageFromType(type: String) -> String {
        
        switch type {
        case "normal":
            return "aqi.low"
        case "fighting":
            return "sparkles"
        case "flying":
            return "wind"
        case "poison":
            return "drop.triangle"
        case "ground":
            return "capsule"
        case "rock":
            return "circle"
        case "bug":
            return "ant"
        case "ghost":
            return "eye.fill"
        case "steel":
            return "scalemass"
        case "fire":
            return "flame"
        case "water":
            return "drop"
        case "grass":
            return "leaf"
        case "electric":
            return "bolt"
        case "psychic":
            return "stopwatch"
        case "ice":
            return "hexagon"
        case "dragon":
            return "flame"
        case "dark":
            return "moon"
        case "fairy":
            return "aqi.low"
        case "unknown":
            return "diamond.fill"
        case "shadow":
            return "eye.circle"
        default:
            return "diamond.fill"
        }
    }
}

struct PokemonPageView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonPageView(pokemonName: "")
            .preferredColorScheme(.dark)
    }
}
