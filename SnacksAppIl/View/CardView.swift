//
//  CardView.swift
//  SnacksAppIl
//
//  Created by Иван Легенький on 15.01.2024.
//

import SwiftUI

struct CardView: View {
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack {
                        Text("Cart")
                            .font(.system(size: 30))
                            .padding(.trailing)
                        
                        Spacer()
                        
                        Button {
                            mode.wrappedValue.dismiss()
                        } label: {
                            Text("3")
                                .imageScale(.large)
                                .padding()
                                .frame(width: 79, height: 90)
                                .background(Color.purple.opacity(0.5))
                                .clipShape(.capsule)
                        }
                        .foregroundColor(.black)
                        
                        Button {
                            mode.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: "arrow.left")
                                .imageScale(.large)
                                .padding()
                                .frame(width: 79, height: 90)
                                .overlay(RoundedRectangle(cornerRadius: 50).stroke().opacity(0.4))
                        }
                        .foregroundColor(Color.black)
                    }
                    .padding(30)
                    
                    VStack(spacing: 20) {
                        ForEach(productList, id: \.id) { product in
                            CartProductCard(product: product)
                        }
                    }
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Delivery Amount")
                            
                            Spacer()
                            
                            Text("$22.35")
                                .font(.system(size: 24, weight: .semibold))
                        }
                        
                        Divider()
                        
                        Text("Total Amount")
                            .font(.system(size: 24))
                        
                        Text("USD 130.00")
                            .font(.system(size: 36, weight: .semibold))
                    }
                    .padding(30)
                    .frame(maxWidth: .infinity)
                    .background(Color.purple.opacity(0.5))
                    .clipShape(.rect(cornerRadius: 30))
                    .padding()
                    
                    Button {
                        
                    } label: {
                        Text("Make payment")
                            .frame(maxWidth: .infinity)
                            .frame(height: 80)
                            .background(Color.purple.opacity(0.5))
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(Color.black)
                            .clipShape(.capsule)
                            .padding()
                    }
 
                }
            }
        }
        .navigationBarBackButtonHidden()
    }

}

#Preview {
    CardView()
}

struct CartProductCard: View {
    var product: Product
    
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            Image(product.image)
                .resizable()
                .scaledToFit()
                .padding()
                .frame(width: 80, height: 80)
                .background(Color.gray.opacity(0.1))
                .clipShape(.circle)
            
            VStack(alignment: .leading) {
                
                Text(product.name)
                    .font(.headline)
                
                Text(product.category)
                    .font(.callout)
                    .opacity(0.5)
            }
            
            Spacer()
            
            Text("$\(product.price).0")
                .padding()
                .background(Color.purple.opacity(0.5))
                .clipShape(.capsule)
        }
    }
}
