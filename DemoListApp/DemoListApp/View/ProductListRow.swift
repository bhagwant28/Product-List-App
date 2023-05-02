//
//  ProductListRow.swift
//  DemoListApp
//
//  Created by Bhagwant Sangvikar on 02/05/23.
//

import SwiftUI

struct ProductListRow: View {
    var imageSize: CGFloat = 100
    var vm: ProductRowViewModel = ProductRowViewModel(product: Product())
    
    @State var isFav: Bool = false
    @State var isAddToCart: Bool = false
    
    init(vm: ProductRowViewModel) {
        self.vm = vm
    }
    
    var body: some View {
        HStack {
            imageView()
            VStack(alignment: .leading, spacing: 5) {
                Text(vm.title)
                    .font(.title3)
                Text("Brand: \(vm.brand)")
                Text("Price:$ \(vm.price)")
                
                HStack {
                    Button {
                        isAddToCart.toggle()
                    } label: {
                        if isAddToCart {
                            Image(systemName: "cart.fill")
                                .foregroundColor(.blue)
                        } else {
                            Image(systemName: "cart")
                                .foregroundColor(.gray)
                        }
                    }.frame(width: 45, height: 45)
                        .padding(20)
                    
                    Button {
                        isFav.toggle()
                    } label: {
                        if isFav {
                            Image(systemName: "heart.fill")
                                .foregroundColor(.red)
                        } else {
                            Image(systemName: "heart")
                                .foregroundColor(.gray)
                        }
                    }.frame(width: 45, height: 45)

                }
            }
        }
    }
}

extension ProductListRow {
    
    func imageView() -> some View {
        AsyncImage(url: URL(string: vm.image)) { phase in
            if let image = phase.image {
                image.resizable()
                    .scaledToFill()
                    .frame(width: imageSize, height: imageSize)
                    .clipped()// Displays the loaded image.
            } else if phase.error != nil {
                Text(phase.error?.localizedDescription ?? "error")
                    .foregroundColor(Color.pink)
                    .frame(width: imageSize, height: imageSize)// Indicates an error.
            } else {
                ProgressView()
                    .frame(width: imageSize, height: imageSize) //as placehoder
            }
        }
    }
}
