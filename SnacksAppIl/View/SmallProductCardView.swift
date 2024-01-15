//
//  SmallProductCardView.swift
//  SnacksAppIl
//
//  Created by Иван Легенький on 15.01.2024.
//

import SwiftUI

struct SmallProductCardView: View {
    @EnvironmentObject var vm: CartViewModel
    var product: Product
    
    var body: some View {
        ZStack {
            Image(product.image)
                .resizable()
                .scaledToFit()
                .rotationEffect(Angle(degrees: 30))
            
            ZStack {
                VStack(alignment: .leading) {
                    Text(product.name)
                        .font(.system(size: 18, weight: .semibold))
                        .frame(width: 140)
                    
                    Text(product.category)
                        .foregroundColor(Color.black)
                        .font(.system(size: 12))
                        .padding()
                        .background(Color.white.opacity(0.5))
                        .clipShape(.capsule)
                        .frame(width: 80)
             
                    
                    Spacer()
                    
                    HStack {
                        Text("$\(product.price).0")
                            .font(.system(size: 14, weight: .semibold))
                            .frame(width: 60)
                        
                        Spacer()
                        
                        Button {
                            vm.addToCart(product: product)
                        } label: {
                            
                            Spacer()
                            
                            Image(systemName: "basket")
                                .imageScale(.large)
                                .frame(width: 45, height: 40)
                                .background(Color.black)
                                .clipShape(.capsule)
                                .foregroundColor(Color.white)
                        }
                    }
                    .padding(.trailing, -12)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 45)
                    .background(Color.white.opacity(0.9))
                    .clipShape(.capsule)
                }
            }
            .padding(20)
            .frame(width: 17, height: 215)
        }
        .frame(width: 170, height: 215)
        .background(product.color.opacity(0.13))
        .clipShape(.rect(cornerRadius: 30))
        .padding(.leading)
    }
}
