//
//  ItemListView.swift
//  PokedexSwiftUI
//
//  Created by Oguz Demırhan on 25.04.2021.
//

import SwiftUI

struct ItemListView: View {
    
    
    @StateObject var itemViewModel = ItemViewModel()
    private var gridItems = [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]
    private var gridFourItems = [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]
    @State private var showFourGrid = false
    
    var body: some View {
        
        
        
        if itemViewModel.itemResults.count > 20 {

            if showFourGrid  {
                
                ScrollView(.vertical) {
                    LazyVGrid(columns: gridFourItems) {
                        ForEach(itemViewModel.itemResults,id:\.self) { item in

                            ItemCellView(name: item.name)
                        }
                     
   
                    }
                 
                }
                .overlay(                  Group{
                 Button(action:{
                     
                    showFourGrid.toggle()
                 }) {


                     VStack{
                        
                        if showFourGrid {
                            Image(systemName: "square.grid.4x3.fill")
                                .font(.system(size: 28))
                                .foregroundColor(.red)
                        }
                        else {
                            Image(systemName: "circle.grid.3x3.fill")
                                .font(.system(size: 28))
                                .foregroundColor(.red)
                        }
                         
                         
                         
                     }
                     
                     .frame(width: 78, height: 78)
                     .background(Color(UIColor.black))
                     .cornerRadius(39)
                     .padding(.leading,UIScreen.main.bounds.width - 125)
                     .padding(.bottom,UIScreen.main.bounds.height-870)
                     
                     
                     
                         
                 }
             }.frame(maxHeight: .infinity,alignment: .bottom))
                
                .navigationBarHidden(true)
            }
            
            else {
                
                
               ScrollView(.vertical) {
                   LazyVGrid(columns: gridItems) {
                       ForEach(itemViewModel.itemResults,id:\.self) { item in

                           ItemCellView(name: item.name)
                       }
                    
  
                   }
                
                
                
                
        
               }
               .overlay(                  Group{
                Button(action:{
                    
                    showFourGrid.toggle()
                }) {


                    VStack{
                        
                        if showFourGrid {
                            Image(systemName: "square.grid.4x3.fill")
                                .font(.system(size: 28))
                                .foregroundColor(.red)
                        }
                        else {
                            Image(systemName: "circle.grid.3x3.fill")
                                .font(.system(size: 28))
                                .foregroundColor(.red)
                        }
                        
                    }
                    .frame(width: 78, height: 78)
                    .background(Color(UIColor.black))
                    .cornerRadius(39)
                    .padding(.leading,UIScreen.main.bounds.width - 125)
                    .padding(.bottom,UIScreen.main.bounds.height-870)
                    
                    
                    
                        
                }
            }.frame(maxHeight: .infinity,alignment: .bottom))
               .navigationBarHidden(true)
            
            }


            

        }
        
  
      
        
        
        
        
        else {
           PokeballLoadingView()
        }
        
        
        
        
    }
}

struct ItemListView_Previews: PreviewProvider {
    static var previews: some View {
        ItemListView()
    }
}
