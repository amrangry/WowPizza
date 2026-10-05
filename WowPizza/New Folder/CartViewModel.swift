//
//  CartViewModel.swift
//  WowPizza
//
//  Created by Amr Ahmed Elghadban on 09/02/2025.
//

import Foundation

/// The Model to hold our orders.
class CartViewModel: ObservableObject {
    
    @Published var orders: [OrderItem] = []
    var customerName = "Customer Name"
    var orderType: OrderType = .takeout
    private var lastID: Int = 0
    
    static let shared = CartViewModel()
    
    ///Use only for testing purposes
    init() {
        // Testing Code: comment out for production
        //orderItems.append(OrderItem(id:0,item: testMenuItem))
        // orderItems.append(OrderItem(id:1,item: MenuModel().menu[3],quantity: 2))
        //lastID = 1
        //testing code end
        
    }
    
    ///Computes the count of order items
    var orderCount: Int {
        orders.count
    }
    
    ///Computes the grand total of the orders.
    var orderTotal: Double {
        var total: Double = 0.0
        for item in orders {
            total += item.totalPrice
        }
        return total
    }
    ///Adds an Order with a menu item and quantity
    func addOrder(_ item: MenuItem, quantity: Int = 1) {
        lastID += 1
        let newOrder = OrderItem(id: (lastID) , item: item, quantity: quantity)
        orders.append(newOrder)
    }
    
    /// Adds an Order from a OrderItem
    func addOrder(orderItem: OrderItem) {
        var  newOrder = orderItem
        lastID += 1
        newOrder.id = lastID
        orders.append(newOrder)
    }
    
    func removeOrder(_ item: MenuItem) {
        let orderItem = orders.first { $0.item == item }
        if let id = orderItem?.id {
            removeOrder(id: id)
        }
    }
    
    func removeOrder(_ orderItem: OrderItem) {
        let id = orderItem.id
        removeOrder(id: id)
    }
    
    /// Removes an Order
    func removeOrder(id: Int) {
        if let index = orders.firstIndex(where: {$0.id == id}) {
            orders.remove(at: index)
        }
    }
    /// Removes the last Order
    func removeLast() {
        orders.removeLast()
    }
    
}
