//
//  RatingView.swift
//  WowPizza
//
//  Created by Amr Ahmed Elghadban on 08/02/2025.
//

import SwiftUI

struct RatingView: View {
    let selectedImageSymbolName = "fork.knife.circle.fill"
    let unselectedImageSymbolName = "fork.knife.circle"
    // let selectedImageSymbolName = "star.fill"
    // let unselectedImageSymbolName = "star"
    var rating: Double
    var body: some View {
        HStack {
            if rating.truncatingRemainder(dividingBy: 1) == 0 {
                Text("\(Int(rating))")
            } else {
                Text("\(String(format: "%.1f", rating))")
            }
            //            ForEach(0..<Int(ceil(rating)), id: \.self) { _ in
            //                //Image(systemName: "star.fill")
            //                Image(systemName: selectedImageSymbolName).foregroundStyle(.yellow)
            //            }
            //            ForEach(Int(ceil(rating))..<5, id: \.self) { _ in
            //                Image(systemName: unselectedImageSymbolName).foregroundStyle(.secondary)
            //            }
            ForEach(1...5, id: \.self) { index in
                Image(systemName: index <= Int(ceil(rating)) ? selectedImageSymbolName : unselectedImageSymbolName)
            }
        }
    }
}

#Preview {
    RatingView(rating: 3.5)
}
