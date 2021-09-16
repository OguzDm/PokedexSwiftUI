//
//  UIApplication+Extension.swift
//  PokedexSwiftUI
//
//  Created by Oğuz Demirhan on 16.09.2021.
//

import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
