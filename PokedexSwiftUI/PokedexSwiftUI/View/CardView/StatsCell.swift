//
//  StatsCell.swift
//  PokedexSwiftUI
//
//  Created by Oguz Demırhan on 23.04.2021.
//

import SwiftUI

struct StatsCell: View {
    
    var stats: [Stats]?
    var body: some View {
        
        if stats != nil {
            HStack{
                VStack(spacing:30){
                    
                    Text("Hp:")
                        .frame(width: 120, height: 30, alignment: .leading)
                    Text("Defense:")
                        .frame(width: 120, height: 30, alignment: .leading)
                    Text("Special Attack:")
                        .frame(width: 120, height: 30, alignment: .leading)
                    Text("Special Def:")
                        .frame(width: 120, height: 30, alignment: .leading)
                    Text("Speed:")
                        .frame(width: 120, height: 30, alignment: .leading)
                    
                }.frame(width: 120, height: 250, alignment:.leading)
                VStack(spacing:57){
                    
                    
                    ProgressView(value: Float(stats?[0].base_stat ?? 50), total: 100)
                        .accentColor(.red)
                        .scaleEffect(x:1,y:3,anchor: .center)
                    
                    
                    ProgressView(value: Float(stats?[1].base_stat ?? 50), total: 90)
                        .accentColor(.green)
                        .scaleEffect(x:1,y:3,anchor: .center)
                    
                    
                    ProgressView(value: Float(stats?[2].base_stat ?? 50), total: 90)
                        .accentColor(.yellow)
                        .scaleEffect(x:1,y:3,anchor: .center)
                    
                    
                    ProgressView(value: Float(stats?[3].base_stat ?? 50), total: 90)
                        .accentColor(.blue)
                        .scaleEffect(x:1,y:3,anchor: .center)
                    
                    
                    ProgressView(value: Float(stats?[4].base_stat ?? 50), total: 90)
                        .accentColor(.purple)
                        .scaleEffect(x:1,y:3,anchor: .center)
                    
                }
                .frame(width: 200, height: 250, alignment:.center)
                
            }
        }
        
        else {
            PokeballLoadingView()
        }
    }
}

struct StatsCell_Previews: PreviewProvider {
    static var previews: some View {
        StatsCell(stats: nil)
    }
}
