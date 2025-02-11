//
//  OrderItem.swift
//  WowPizza
//
//  Created by Amr Ahmed Elghadban on 08/02/2025.
//

import Foundation

/// The basic unit of an order. Contains a menu item and user customization of that item.
struct OrderItem: Identifiable {
//    var id: UUID = UUID()
    var id: Int
    var name: String = ""
    var item: MenuItem
    // User customizations of the order
    var quantity: Int
    var comments: String = ""
    
    init(id: Int, item: MenuItem, quantity: Int = 1) {
        self.id = id
        self.item = item
        self.quantity = quantity
    }
    
    init(id: Int, item: MenuItem, quantity: Int, extraIngredients: Bool, name: String, comments: String){
        self.id = id
        self.item = item
        self.quantity = quantity
        self.name = name
        self.comments = comments
    }
    
    ///Computes the extended price for an item
    var totalPrice: Double {
        item.price * Double(quantity)
    }
    
    mutating func incrementQuantity() {
        quantity += 1
    }
    
    mutating func decrementQuantity() {
        guard quantity > 1 else { return }
        quantity -= 1
    }
    
    mutating func resetQuantity() {
        quantity = 1
    }
    
    mutating func reset() {
        resetQuantity()
    }
    
    func isEmpty() -> Bool {
        return quantity == 0
    }
}

extension OrderItem {
    
    static var sample: OrderItem {
        sampleData.first!
    }
    
    static var sampleData: [OrderItem] = [
        .init(id: 1, item: MenuItem.all.first ?? .sample),
        .init(id: 2, item: MenuItem.all.first ?? .sample)
    ]
}
