//
//  ProductCardView.swift
//  SnacksAppIl
//
//  Created by Иван Легенький on 14.01.2024.
//

import SwiftUI

struct ProductCardView: View {
    var vm: CartViewModel
    var product: Product
    
    var body: some View {
        ZStack {
            Image(product.image)
                .resizable()
                .scaledToFit()
                .rotationEffect(Angle(degrees: 46))
            
            ZStack {
                VStack(alignment: .leading) {
                    Text("\(product.name)")
                        .font(.system(size: 36, weight: .semibold))
                    
                    Text(product.category)
                        .font(.callout)
                        .padding()
                        .background(Color.white.opacity(0.5))
                        .clipShape(.capsule)
                    
                    Spacer()
                    
                    HStack {
                        Text("$\(product.price).0")
                            .font(.system(size: 24, weight: .semibold))
                        
                        Spacer()
                        
                        Button {
                            withAnimation {
                                vm.addToCart(product: product)
                            }
                        } label: {
                            Image(systemName: "basket")
                                .imageScale(.large)
                                .frame(width: 90, height: 68)
                                .background(Color.black)
                                .clipShape(.capsule)
                                .foregroundColor(Color.white)
                        }
                        .padding(.horizontal, -10)
                    }
                    .padding(.leading)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 80)
                    .background(Color.white.opacity(0.9))
                    .clipShape(.capsule)
                }
            }
            .padding(30)
            .frame(width: 336, height: 422)
        }
        .frame(width: 336, height: 422)
        .background(product.color.opacity(0.13))
        .clipShape(.rect(cornerRadius: 57))
        .padding(.leading, 20)
    }
}

#Preview {
    ProductCardView(vm: CartViewModel() ,product: Product.init(name: "Hello", category: "You", image: "Name",color: .red, price: 9))
}
