//
//  View+Extension.swift
//  PokedexSwiftUI
//
//  Created by Oğuz Demirhan on 16.09.2021.
//

import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
