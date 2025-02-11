//
//  HeaderView.swift
//  WowPizza
//
//  Created by Amr Ahmed Elghadban on 08/02/2025.
//

import SwiftUI

struct HeaderView: View {
    
    @EnvironmentObject var cartViewModel: CartViewModel
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    var body: some View {
        if(( verticalSizeClass ?? .regular) != .compact) {
            ZStack(alignment: .trailing) {
                Rectangle()
                    .fill(Color.blue)
                    .opacity(0.25)
                    .overlay(
                        Rectangle()
                            .stroke(Color.brown, lineWidth: 1) // ✅ Border using stroke
                    )
                Circle()
                    .stroke(style: StrokeStyle(lineWidth: 1))
                    .fill(.red)
                    .opacity(0.25)
                VStack {
                    HStack {
                        Text("🍕 Hello WoW Pizza! ")
                            .bold()
                            .foregroundColor(.white)
                            .padding()
                        Spacer()
                    }
                    HStack {
                        Label("Orders", systemImage: "tray.full").padding()
                        Spacer()
                        Label {
                            Text("\(cartViewModel.orders.count) orders")
                        } icon: {
                            Image(systemName: cartViewModel.orders.isEmpty ? "list.number" : "list.number.rtl")
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .padding()
        } else {
            VStack {
                Text("🍕 Hello WoW Pizza! ")
                    .bold()
                    .foregroundColor(.white)
                    .padding()
                HStack {
                    Label("Orders", systemImage: "tray.full").padding()
                    Spacer()
                    Text("\(cartViewModel.orders.count) orders")
                }
            }
        }

    }
}

#Preview {
    HeaderView().environmentObject(CartViewModel())
}
