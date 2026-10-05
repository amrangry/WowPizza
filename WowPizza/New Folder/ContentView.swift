//
//  ContentView.swift
//  WowPizza
//
//  Created by Amr Ahmed Elghadban on 08/02/2025.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    
    @State var menuItems: [MenuItem] = MenuItem.all
    @State private var isShowShoppingCart: Bool = false
    
    @StateObject var cartViewModel: CartViewModel = .shared
    
    var body: some View {
        VStack(spacing: 0) { // ✅ Remove unwanted spacing
            
            // 🔹 Fixed Header at the top
            HeaderView()
                .frame(height: 100)
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .shadow(radius: 2)
            
            // 🔹 Toggle and Cart Button Section
            VStack {
                HStack {
                    Toggle("Show Cart", isOn: $isShowShoppingCart)
                        .tint(.red)
                        .onChange(of: isShowShoppingCart) { oldValue, newValue in
                            print("Toggle changed to: \(newValue)")
                        }
                    
                    Spacer()
                    
                    Button {
                        isShowShoppingCart.toggle()
                    } label: {
                        Image(systemName: isShowShoppingCart ? "menucard" : "cart")
                    }
                    .cornerRadius(10)
                }
            }
            .foregroundColor(.white)
            .font(.title)
            .padding()
            
            // 🔹 Content Area - Scrollable
            ZStack {
                Color.clear // Keeps ZStack within VStack
                if isShowShoppingCart {
                    VStack {
                        Text("Show Shopping Cart")
                        HStack {
                            Text("Orders: \(cartViewModel.orders.count)")
                        }
                        OrdersView()
                    }
                } else {
                    MenuView(menuArray: $menuItems)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity) // Takes up all available space
            .padding(.horizontal)
            
            // 🔹 Fixed Footer at the bottom
            FooterView()
                .frame(height: 80)
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .shadow(radius: 2)
        }
        .background(
            LinearGradient(
                colors: [
                    Color(red: 255/255, green: 102/255, blue: 0/255),  // 🍅 Tomato Sauce Red
                    Color(red: 255/255, green: 204/255, blue: 0/255),  // 🧀 Cheese Yellow
                    Color(red: 204/255, green: 102/255, blue: 0/255),  // 🍕 Crispy Crust Brown
                    Color(red: 34/255, green: 139/255, blue: 34/255)   // 🌿 Basil Green
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
        )
        .environmentObject(cartViewModel)
    }
}

#Preview {
    ContentView()
}
