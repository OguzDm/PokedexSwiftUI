//
//  PokeImageCell.swift
//  PokedexSwiftUI
//
//  Created by Oguz Demırhan on 24.04.2021.
//

import SwiftUI
import Kingfisher

struct PokeImageCell: View {
    
    let image: String
    var body: some View {
        
        if image != "" {
            ZStack{
                KFImage(URL(string: image))
                    .resizable()
            }.frame(width: 100, height: 100, alignment: .center)
            .background(Color(UIColor.white))
            .cornerRadius(12)
            .shadow(color: Color(UIColor.darkGray), radius: 1, x: 0.0, y: 0.0)
        }
  
    }
}

struct PokeImageCell_Previews: PreviewProvider {
    static var previews: some View {
        PokeImageCell(image: "Charmander")
    }
}
