//
//  MenuItem.swift
//  WowPizza
//
//  Created by Amr Ahmed Elghadban on 08/02/2025.
//

import Foundation

struct MenuItem: Identifiable {
    var id: UUID = UUID()
    var category: MenuCategory
    var name: String
    var description: String?
    var image: String?
    var price: Double
    var priceBeforeDiscount: Double?
    let size: String
    let rating: Double
    let toppings: [String]
    var isAddedToCart: Bool = false
}

/// Custom hash method necessary for navigation paths to use `Hashable` protocol
extension MenuItem: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

/// Custom equals method necessary for navigation paths to use `Equatable` protocol
extension MenuItem: Equatable {
    public static func == (lhs: MenuItem, rhs: MenuItem) -> Bool {
        lhs.id == rhs.id &&
        lhs.category == rhs.category &&
        lhs.description == rhs.description &&
        lhs.name == rhs.name &&
        lhs.price == rhs.price &&
        lhs.rating == rhs.rating
    }
}

extension MenuItem {
    
    func getDiscount() -> Double {
        guard let priceBeforDiscount = priceBeforeDiscount else { return 0 }
        if price >= priceBeforDiscount {
            return 0
        } else {
            return priceBeforDiscount - price
        }
    }
    
    func getDiscountPercentage() -> Double {
        guard let priceBeforDiscount = priceBeforeDiscount else { return 0 }
        return (getDiscount() / priceBeforDiscount) * 100
    }
    
    func isOnDiscount() -> Bool {
        return getDiscount() > 0
    }
    
    func getToppingsString() -> String {
        return toppings.joined(separator: ", ")
    }
    
    func getSizeAndToppingsString() -> String {
        return "\(size), \(getToppingsString())"
    }
    
}

extension MenuItem {
    
    static var sample: MenuItem {
        all.first!
    }
    
    static let all: [MenuItem] = [
        .init(category: .originals,
              name: "Hawaiian Pizza",
              description: "Spicy ham and pineapple on a sweet tomato sauce base.",
              image: "hawaiian_pizza",
              price: 12.99,
              priceBeforeDiscount: 14.99,
              size: "Medium",
              rating: 3,
              toppings: ["Ham", "Pineapple", "Sausage"]),
        .init(category: .originals,
              name: "Meat Lovers Pizza",
              description: "Spicy pepperoni, sausage, bacon, and ham on a sweet tomato sauce base.",
              image: "meat_lovers_pizza",
              price: 13.99,
              priceBeforeDiscount: 15.99,
              size: "Medium",
              rating: 4.5,
              toppings: ["Pepperoni", "Sausage", "Bacon", "Ham"]),
        .init(category: .vegetarian,
              name: "Veggie Delight Pizza",
              description: "A medley of fresh vegetables including mushrooms, onions, bell peppers, olives, and tomatoes on a light cream sauce base.",
              image: "veggie_delight_pizza",
              price: 11.99,
              priceBeforeDiscount: 13.99,
              size: "Medium",
              rating: 4,
              toppings: ["Mushrooms", "Onions", "Bell Peppers", "Olives", "Tomatoes"]),
        .init(category: .vegetarian,
              name: "Veggie Ristorante Pizza",
              description: "A medley of fresh vegetables including mushrooms, onions, bell peppers, olives, and tomatoes on a light cream sauce base.",
              image: "veggie_delight_pizza",
              price: 15.99,
              priceBeforeDiscount: 10.99,
              size: "Medium",
              rating: 4,
              toppings: ["Mushrooms", "Onions", "Bell Peppers", "Olives", "Tomatoes"]),
        .init(category: .italian,
              name: "Pepperoni Paradise Pizza",
              description: "Thinly sliced pepperoni on a sweet tomato sauce base.",
              image: "pepperoni_paradise_pizza",
              price: 13.99,
              priceBeforeDiscount: 15.99,
              size: "Small",
              rating: 3.5,
              toppings: ["Pepperoni"]),
        .init(category: .italian,
              name: "Supreme Pizza",
              description: "Pepperoni, sausage, bacon, ham, mushrooms, onions, bell peppers, olives, and tomatoes on a sweet tomato sauce base.",
              image: "supreme_pizza",
              price: 16.99,
              priceBeforeDiscount: 18.99,
              size: "Medium",
              rating: 4.5,
              toppings: ["Pepperoni", "Sausage", "Bacon", "Ham", "Mushrooms", "Onions", "Bell Peppers", "Olives", "Tomatoes"]),
        .init(category: .italian,
              name: "Meat Lovers Pizza",
              description: "Thinly sliced pepperoni, sausage, bacon, and ham on a sweet tomato sauce base.",
              image: "meat_lovers_pizza",
              price: 14.99,
              priceBeforeDiscount: 16.99,
              size: "Large",
              rating: 2.5,
              toppings: ["Pepperoni", "Sausage", "Bacon", "Ham"])
    ]
    
}
