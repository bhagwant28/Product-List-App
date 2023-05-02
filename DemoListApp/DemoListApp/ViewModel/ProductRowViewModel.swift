//
//  ProductRowViewModel.swift
//  DemoListApp
//
//  Created by Bhagwant Sangvikar on 02/05/23.
//

import Foundation
class ProductRowViewModel: ObservableObject {
    private var prod: Product
    
    @Published var id: Int?
    @Published var title: String = ""
    @Published var price: Double = 0.0
    @Published var image: String = ""
    @Published var brand: String = ""
    @Published var ratingCount: String = ""
    
    
    init(product: Product) {
        prod = product
        if let title = prod.title {
            self.title = title
        }
        if let imgurl = prod.imageURL {
            image = imgurl
        }
        if let price = prod.saleUnitPrice {
            self.price = price
        }
        if let brand = prod.brand {
            self.brand = brand
        }
//        if let count = prod.ratingCount {
//            self.ratingCount = count
//        }
    }
}
