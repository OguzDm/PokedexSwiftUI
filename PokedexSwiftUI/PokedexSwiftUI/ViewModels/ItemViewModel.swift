//
//  ItemViewModel.swift
//  PokedexSwiftUI
//
//  Created by Oguz Demırhan on 25.04.2021.
//

import Foundation

class ItemViewModel : ObservableObject {
    
    @Published var itemResults = [ItemResults]()
    
    init() {
        fetchData()
    }
    
    func fetchData () {
            let itemURL = "https://pokeapi.co/api/v2/item?offset=0&limit=300"
            guard let url = URL(string: itemURL) else {return}
            let task = URLSession.shared.dataTask(with: url) { (data, resp, err) in
                
                guard let data = data else {return}
                do {
                    let decoder = try JSONDecoder().decode(ItemListModel.self, from: data)
                    DispatchQueue.main.async {
                       
                        self.itemResults = decoder.results
                        print(decoder.results[0].name)
                    }
                }
                catch(let error){
                    print(error.localizedDescription)
                }
            }
            task.resume()
    }
}
