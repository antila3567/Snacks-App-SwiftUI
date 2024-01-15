//
//  CategoryModel.swift
//  SnacksAppIl
//
//  Created by Иван Легенький on 14.01.2024.
//

import Foundation

struct CategoryModel: Identifiable, Hashable {
    var id: UUID = .init()
    var icon: String
    var title: String
}

var categoryList: [CategoryModel] = [
   CategoryModel(icon: "", title: "All"),
   CategoryModel(icon: "choco", title: "Choco"),
   CategoryModel(icon: "waffles", title: "Waffles"),
   CategoryModel(icon: "toffee", title: "Toffee"),
]
