//
//  OrdersView.swift
//  WowPizza
//
//  Created by Amr Ahmed Elghadban on 08/02/2025.
//

import SwiftUI

struct OrdersView: View {
    
    @EnvironmentObject var cartViewModel: CartViewModel
    
    var body: some View {
        VStack {
            if cartViewModel.orders.isEmpty {
                VStack {
                    Image(systemName: "cart.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.gray.opacity(0.5))
                    Text("Your cart is empty")
                        .font(.headline)
                        .foregroundColor(.secondary)
                        .padding(.top, 8)
                }
                .padding()
            } else {
                ScrollView {
                    LazyVStack {
                        ForEach($cartViewModel.orders) { $order in
                            HStack {
                                OrderRowView(order: $order)
                                    .padding(.bottom, 4)
                                    .padding([.leading, .trailing], 8)
                                Button(action: {
                                    cartViewModel.removeOrder(order)
                                }) {
                                    Image(systemName: "xmark.circle.fill")
                                        .resizable()
                                        .frame(width: 24, height: 24)
                                        .foregroundColor(.red)
                                        .padding(8)
                                }
                                .background(Circle().fill(Color.red.opacity(0.2)))
                                .padding(.trailing, 8)
                            }
                            .transition(.slide)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    // .constant(OrderItem.sampleData) >> Binding<Value> Creates a binding with an immutable value.
    OrdersView().environmentObject(CartViewModel())
}
