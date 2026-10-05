//
//  MenuView.swift
//  WowPizza
//
//  Created by Amr Ahmed Elghadban on 08/02/2025.
//

import SwiftUI

struct MenuView: View {
    
    @Binding var menuArray: [MenuItem]
    
    var body: some View {
        //        List {
        //            LazyVStack {
        //                ForEach($menuArray) { $item in
        //                    MenuItemView(item: $item)
        //                }
        //            }
        //        }
        List(MenuCategory.allCases, id: \.self) { category in
            Section {
                ForEach(menuArray.filter { $0.category == category }) { item in
                    MenuItemView(item: binding(for: item))
                }
            } header: {
                Text(category.rawValue)
            }
        }
    }
    
    
    private func binding(for item: MenuItem) -> Binding<MenuItem> {
        guard let index = menuArray.firstIndex(where: { $0.id == item.id }) else {
            fatalError("Item not found in menuArray")
        }
        return $menuArray[index]
    }
}

// MARK: - Preview
#Preview {
    // Create a sample array of AnyProduct
    let sampleMenu = MenuItem.all
    return MenuView(menuArray: .constant(sampleMenu))
}
