//
//  ItemViewModel.swift
//  PokedexSwiftUI
//
//  Created by Oguz Demırhan on 25.04.2021.
//

import Foundation

class ItemListViewModel : ObservableObject {
    
    @Published var itemResults = [ItemResults]()
    var next = Constants.baseItemURL
    
    func fetchData () {
        
            guard let url = URL(string: next) else {return}
            let task = URLSession.shared.dataTask(with: url) { (data, resp, err) in
                
                guard let data = data else {return}
                do {
                    let decoder = try JSONDecoder().decode(ItemListModel.self, from: data)
                    DispatchQueue.main.async {
                        self.itemResults.append(contentsOf: decoder.results)
                        self.next = decoder.next
                    }
                }
                catch(let error){
                    print(error.localizedDescription)
                }
            }
            task.resume()
    }
}
