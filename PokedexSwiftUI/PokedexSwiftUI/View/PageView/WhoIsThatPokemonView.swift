//
//  WhoIsThatPokemonView.swift
//  PokedexSwiftUI
//
//  Created by Oguz Demırhan on 27.04.2021.
//

import SwiftUI
import Kingfisher

struct WhoIsThatPokemonView: View {
    
    @State private var guessName: String = ""
    @StateObject var whoIsThatPokemonViewModel = WhoIsThatPokemonViewModel()
    @State private var showingWonAlert = false
    @State private var showingLoseAlert = false
    @State private var title = ""
    @State private var message = ""
    @State private var isAnimated = false
    @State private var isRefreshed = false
    
    var body: some View {
        VStack{
            
            Button(action: {
                
                isRefreshed.toggle()
                whoIsThatPokemonViewModel.fetchData()
            }){
                Image(systemName: "arrow.2.circlepath")
                    .font(.title)
                    .foregroundColor(.black)
                    .rotationEffect(Angle(degrees: isRefreshed ? 360:0))
                    .animation(.easeOut)
                    .padding(.bottom,120)
                    .padding(.leading,330)
            }
            
            Image("whoisthat")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .shadow(color: .black, radius: 4, x: 0.0, y: 0.0)
                .shadow(color: .black, radius: 4, x: 0.0, y: 0.0)
                .overlay(Image("black")
                            .resizable()
                            .frame(width: 250, height: 250, alignment: .center)
                            .padding(.trailing,170)
                            .padding(.bottom,10)
                            .mask(KFImage(URL(string: whoIsThatPokemonViewModel.sprite))
                                    .resizable()
                                    .padding(.trailing,170)
                                    .padding(.bottom,10)
                                  
                            ))
            
            TextField("Who is that Pokemon?", text: $guessName)
                .extensionTextFieldView(roundedCornes: 6, startColor: Color(#colorLiteral(red: 0.4105286896, green: 0.7708772421, blue: 0.8806886673, alpha: 1)), endColor: Color(#colorLiteral(red: 0.857052505, green: 0.078011401, blue: 0.08480388671, alpha: 1)))
                .padding(.top,120)
                .padding(.leading,70)
                .padding(.trailing,70)
            
            Button(action: {
                
                isAnimated.toggle()
                
                if guessName.lowercased() == whoIsThatPokemonViewModel.name {
                    
                    showingWonAlert.toggle()
                    title = "Congratz"
                    message = "You Won"
        
                }
                else {
                    showingWonAlert.toggle()
                    title = "Wrong"
                    message = "You guess wrong"
                }
                
                
            }) {
                Image("pokeball")
                    .resizable()
                    .frame(width: 80, height: 80, alignment: .center)
                    .scaleEffect(isAnimated ? 1.7 : 0.7 )
                    .animation(Animation.linear.repeatCount(1).speed(3.0))
                    .scaleEffect(isAnimated ? 0.7: 1.7)
                    .animation(Animation.linear.repeatCount(1).speed(3.0))
                    .padding(.all,15)
            }
            
            .alert(isPresented: $showingWonAlert, content: {
                
                .init(title: Text(title), message: Text(message), dismissButton: .default(Text("Ok"),action: {
                    
                    whoIsThatPokemonViewModel.fetchData()
                    guessName = ""
                }))
                
            })
            
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.4105286896, green: 0.7708772421, blue: 0.8806886673, alpha: 1)), Color(#colorLiteral(red: 0.857052505, green: 0.078011401, blue: 0.08480388671, alpha: 1))]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
        .ignoresSafeArea()
        
        .onTapGesture {
            hideKeyboard()
        }
        
    }
}

struct WhoIsThatPokemonView_Previews: PreviewProvider {
    static var previews: some View {
        WhoIsThatPokemonView()
    }
}
