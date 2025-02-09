//
//  Double+extension.swift
//  WowPizza
//
//  Created by Amr Ahmed Elghadban on 09/02/2025.
//

extension Double {
  
    func getFormattedRating() -> String {
        return String(format: "%.1f", self)
    }
    
    func getFormattedPrice() -> String {
        return String(format: "%.2f", self)
    }
 
}
