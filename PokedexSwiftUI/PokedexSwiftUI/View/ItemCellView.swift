//
//  ItemCellView.swift
//  PokedexSwiftUI
//
//  Created by Oguz Demırhan on 25.04.2021.
//

import SwiftUI
import Kingfisher

struct ItemCellView: View {
    
    let name: String
    @StateObject var itemDetailViewModel = ItemDetailViewModel()
    var body: some View {
        ZStack{
            
            KFImage(URL(string: itemDetailViewModel.itemSprite))
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50, alignment:.center)
            
        }.frame(width: UIScreen.main.bounds.width - 325, height: 100, alignment: .center)
        
        .background(Color(UIColor.red))
        .cornerRadius(12.0)
        .padding()
        
        .onAppear(){
            
            itemDetailViewModel.uploadSprite(itemName: name)
            
        }
    }
}

struct ItemCellView_Previews: PreviewProvider {
    static var previews: some View {
        ItemCellView(name: "pokeball")
    }
}
