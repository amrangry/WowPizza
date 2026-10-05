//
//  MenuItemView.swift
//  WowPizza
//
//  Created by Amr Ahmed Elghadban on 08/02/2025.
//

import SwiftUI

struct MenuItemView: View {
    
    @Binding var item: MenuItem
    @State var isAdded: Bool = false
    @State var quantity: Int = 1
    @State var topping: String?
    @StateObject var cartViewModel: CartViewModel = .shared
    
    init(item: Binding<MenuItem>){
        _item = item
        _topping = State(initialValue: item.wrappedValue.toppings.first ?? "")
    }
    
    var body: some View {
        HStack(alignment: .top) {
            if let imageName = item.image, let imageView = UIImage(named: imageName) {
                Image(uiImage: imageView)
                    .pizzaStyle()
            } else {
                Image("placeholder") // Fallback image
                    .pizzaStyle()
            }
            
            Spacer()
            
            VStack (alignment: .leading) {
                VStack {
                    HStack {
                        Text(item.name)
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.indigo)
                            .padding(.leading, 10)
                        Spacer()
                    }
                    HStack {
                        RatingView(rating: 4.5)
                        Spacer()
                    }
                }
                HStack {
                    Text(item.price, format: .currency(code: "USD"))
                        .fontWeight(.bold)
                    if let value = item.priceBeforeDiscount?.getFormattedPrice(), !value.isEmpty, item.priceBeforeDiscount != item.price {
                        Text(value)
                            .foregroundColor(.secondary)
                            .strikethrough(true)
                        Text("💸")
                    }
                }
                if let value = item.description, !value.isEmpty {
                    HStack {
                        Text("\(value)")
                            .fontWeight(.regular)
                            .foregroundColor(.secondary)
                        Spacer()
                    }
                }
                            
                Stepper(value: $quantity, in: 1...10) {
                    Text("Quantity: \(quantity)")
                        .fontWeight(.bold)
                }.padding(.trailing, 10)
                
                Picker(selection: $topping) {
                    ForEach(item.toppings, id: \.self) { topping in
                        Text("\(topping)").tag(topping)
                    }
                } label: {
                    Text("Toppings:")
                }.pickerStyle(.menu)

                Button {
                    if !item.isAddedToCart {
                        cartViewModel.addOrder(item, quantity: 1)
                    } else {
                        cartViewModel.removeOrder(item)
                    }
                    item.isAddedToCart.toggle()
                } label: {
                    Text("Order Now")
                        .fontWeight(.bold)
                    Image(systemName:  item.isAddedToCart ?  "cart.badge.minus" : "cart.fill.badge.plus")
                        .font(.title)
                }
                .padding([.trailing, .top, .bottom], 10)
                .frame(maxWidth: .infinity, maxHeight: 45, alignment: .center)
                .background(.red, in : Capsule())
                .foregroundColor(.white)
                //.cornerRadius(50)
                .shadow(radius: 5)
                
            }
        }
    }
    
}

#Preview {
    // .constant(OrderItem.sampleData) >> Binding<Value> Creates a binding with an immutable value.
    let value = MenuItem.sample
    return MenuItemView(item: .constant(value))
}
