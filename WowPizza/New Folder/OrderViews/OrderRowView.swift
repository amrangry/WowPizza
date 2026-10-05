//
//  OrderRowView.swift
//  WowPizza
//
//  Created by Amr Ahmed Elghadban on 08/02/2025.
//

import SwiftUI

struct OrderRowView: View {
    
    @Binding var order: OrderItem
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(order.item.name)
                    .font(.headline)
                Spacer()
                Text("\(order.quantity) x \(order.item.price)")
                    .font(.caption)
            }
            HStack(alignment: .firstTextBaseline, spacing: 10) {
                Spacer()
                Label("Total:", systemImage: "sum")
                Text("\(order.totalPrice.getFormattedPrice())")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            HStack {
                Text("\(order.item.description ?? "")")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
        
    }
}

#Preview {
    OrderRowView(order: .constant(OrderItem.sample))
}
