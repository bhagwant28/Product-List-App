//
//  ProductListModel.swift
//  DemoListApp
//
//  Created by Bhagwant Sangvikar on 02/05/23.
//

import Foundation


struct Product: Codable, Identifiable {
    var title: String?
    var description: String?
    var id: String?
    var imageURL: String?
    var price:  [Price]?
  //  var ratingCount: String?
    var brand: String?
    var saleUnitPrice: Double?
}

struct ListModel: Codable, Identifiable {
    var id: String?
    var products: [Product]
}

struct Price: Codable {
    var message: String?
    var value: Double?
}
