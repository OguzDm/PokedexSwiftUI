//
//  TextField+Extension.swift
//  PokedexSwiftUI
//
//  Created by Oğuz Demirhan on 16.09.2021.
//

import SwiftUI

extension TextField {
    
    func extensionTextFieldView(roundedCornes: CGFloat, startColor: Color,  endColor: Color) -> some View {
        self
            .frame(width: 285, height: 10, alignment: .center)
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [startColor, endColor]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(roundedCornes)
            .shadow(color: .black, radius: 2)
            .shadow(color: .black, radius: 2, x: 0.0, y: 0.0)
    }
}
