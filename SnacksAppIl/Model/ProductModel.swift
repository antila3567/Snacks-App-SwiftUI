//
//  ProductModel.swift
//  SnacksAppIl
//
//  Created by Иван Легенький on 14.01.2024.
//

import Foundation
import SwiftUI

struct Product: Identifiable {
    var id: UUID = .init()
    var name: String
    var category: String
    var image: String
    var color: Color
    var price: Int
}

var productList = [
    Product(name: "Good Source", category: "Choco", image: "image 1", color: Color.pink, price: 8),
    Product(name: "Unreal Muffings", category: "Choco", image: "image 2", color: Color.yellow, price: 8),
    Product(name: "Twister Chips", category: "Chips", image: "image 3", color: Color.red, price: 8),
    Product(name: "Coconut Chips", category: "Chips", image: "image 4", color: Color.green, price: 8),
    Product(name: "Regular Nature", category: "Chips", image: "image 5", color: Color.blue, price: 8),
    Product(name: "Dark Russet", category: "Chips", image: "image 6", color: Color.orange, price: 8),
    Product(name: "Deep River", category: "Chips", image: "image 7", color: Color.purple, price: 8),
]
