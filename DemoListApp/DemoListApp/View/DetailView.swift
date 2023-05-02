//
//  DetailView.swift
//  DemoListApp
//
//  Created by Bhagwant Sangvikar on 02/05/23.
//

import SwiftUI

struct DetailView: View {
    var prod: ProductRowViewModel = ProductRowViewModel(product: Product())
    let imageSize: CGFloat = 300
    @State var isFav: Bool = false
    
    init(vm: ProductRowViewModel) {
        self.prod = vm
    }
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    AsyncImage(url: URL(string: prod.image)) { phase in
                        if let image = phase.image {
                            image.resizable()
                                .scaledToFit()
                                .frame( height: imageSize)
                                .clipped()
                            
                        } else if phase.error != nil {
                            
                            Text(phase.error?.localizedDescription ?? "error")
                                .foregroundColor(Color.pink)
                                .frame(width: imageSize, height: imageSize)
                        } else {
                            ProgressView()
                                .frame(width: imageSize, height: imageSize)
                        }
                        
                    }
                    Button {
                        isFav.toggle()
                    } label: {
                        Image(systemName: "heart.fill")
                            .foregroundColor( isFav ? Color.red : Color.gray)
                    }
                    .frame(width: 50, height: 50, alignment: .bottomLeading)
                }
                
                Spacer()
                VStack(alignment: .leading, spacing: 15) {
                    
                    Text(prod.title ?? "")
                        .font(.headline)
                    Text("Brand Name: \(prod.brand)")
                        .font(.footnote)
                    Text("Price:$ \(prod.price)")
                    
                    HStack {
                        Text("Rating")
                        Spacer()
                        ForEach(1..<6) { id in
                            Image(systemName: "star.fill")
                                .foregroundColor(4 > id ? Color.yellow : Color.gray )
                        }
                    }
                    
                    Spacer()
                }.padding()
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationTitle("Detail Screen")
            }
        }
    }
}
