//
//  Home.swift
//  SnacksAppIl
//
//  Created by Иван Легенький on 14.01.2024.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject var vm: CartViewModel
    
    @State private var selectedCategory = "Choco"
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    
                    HStack {
                        Text("Order From The **Snacks App**\(vm.total)")
                            .font(.system(size: 30))
                            .padding(.trailing)
                        
                        Spacer()
                        
                        Image(systemName: "line.3.horizontal")
                            .imageScale(.large)
                            .padding()
                            .frame(width: 79, height: 90)
                            .overlay(RoundedRectangle(cornerRadius: 50).stroke().opacity(0.4))
                    }
                    .padding(30)
                    
                    categoryListView
                    
                    HStack {
                        Text("Choco **Collection**")
                            .font(.system(size: 24))
                        
                        Spacer()
                        
                        NavigationLink {
                            CollectionView()
                        } label: {
                            Image(systemName: "arrow.right")
                                .imageScale(.large)
                        }
                        .foregroundColor(Color.black)
                    }
                    .padding(.horizontal, 30)
                    .padding(.vertical, 15)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(productList, id: \.id) { product in
                                ProductCardView(vm: vm, product: product)
                            }
                        }
                    }
                }
            }
        }
        .navigationBarHidden(true)
    }
    
    var categoryListView: some View {
        HStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(categoryList, id: \.id) { category in
                        let isPicked = selectedCategory == category.title
                        Button {
                            selectedCategory = category.title
                        } label: {
                            HStack {
                                if category.title != "All" {
                                    Image(category.icon)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 20, height: 20)
                                }
                                
                                Text(category.title)
                                    .foregroundColor(isPicked ? .white : .black)
                            }
                            .padding(20)
                            .background(isPicked ? Color.black : Color.gray.opacity(0.2))
                            .foregroundColor(.black)
                            .clipShape(.capsule)
                        }
                    }
                }
                .padding(.horizontal, 30)
            }
        }
    }
}

#Preview {
    Home()
}
