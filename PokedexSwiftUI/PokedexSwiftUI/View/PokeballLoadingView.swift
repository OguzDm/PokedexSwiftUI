//
//  PokeballLoadingView.swift
//  PokedexSwiftUI
//
//  Created by Oguz Demırhan on 27.04.2021.
//

import SwiftUI

struct PokeballLoadingView: View {
    
    @State private var rotation = 0
    @State private var isRotate = false
    
    var animation: Animation {
        Animation.linear
            .repeatForever(autoreverses: false)
    }
    
    var body: some View {
        ZStack {
            Image("pokeball")
                .resizable()
                .frame(width: 60, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .rotationEffect(Angle.degrees(isRotate ? 360 : 0))
                .animation(animation)
                
                
                .onAppear{
                    isRotate = true
                }
                
                .onDisappear{
                    isRotate = false
                }
        }
    }
}

struct PokeballLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        PokeballLoadingView()
    }
}
