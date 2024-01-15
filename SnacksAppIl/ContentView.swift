//
//  ContentView.swift
//  SnacksAppIl
//
//  Created by Иван Легенький on 14.01.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = CartViewModel()
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom, content: {
                Home()
                    .environmentObject(vm)
                
                if vm.products.count > 0 {
                    NavigationLink(destination: CardView()) {
                        HStack(spacing: 30) {
                            Text("\(vm.products.count)")
                                .padding()
                                .background(Color.purple)
                                .clipShape(.circle)
                            
                            VStack(alignment: .leading) {
                                Text("Cart")
                                    .font(.headline)
                                .font(.system(size: 26, weight: .semibold))
                                
                                Text("\(vm.products.count) item")
                                    .font(.headline)
                                .font(.system(size: 18))
                            }
                            
                            Spacer()
                            
                            ForEach(vm.products.suffix(4), id: \.id) { product in
                                    Image(product.image)
                                        .resizable()
                                        .scaledToFit()
                                        .padding(8)
                                        .frame(width: 60, height: 60)
                                        .background(Color.white)
                                        .clipShape(.circle)
                                        .padding(.leading, -60)
                                }
                            }
                        .padding(30)
                        .frame(width: .infinity, height: 100)
                        .background(Color.black)
                        .foregroundColor(Color.white)
                    }

                }
            })
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

#Preview {
    ContentView()
}
