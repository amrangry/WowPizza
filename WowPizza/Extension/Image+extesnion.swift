//
//  Image+extesnion.swift
//  WowPizza
//
//  Created by Amr Ahmed Elghadban on 08/02/2025.
//

import SwiftUI

extension Image {
    func pizzaStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 90, height: 90)
            .aspectRatio(contentMode: .fit)
           //.imageScale(.small)
           // .clipShape(RoundedRectangle(cornerRadius: 10))
            .cornerRadius(10)
            .shadow(color: .teal, radius: 5, x:5, y:5)
    }
}
