//
//  ProductListViewModel.swift
//  DemoListApp
//
//  Created by Bhagwant Sangvikar on 02/05/23.
//

import Foundation

class ProductListViewModel: ObservableObject {
    private var listModel: ListModel?
    @Published var productList: [Product]?
        
    init() {
        self.doRegularWork()
    }
    
    func doRegularWork() {
        Task {
            await getProducts()
        }
    }
    
    
    func getProducts() async {
        do {
            listModel = try await APIService().fetchAllProducnt()
            if let products = listModel?.products {
                self.productList = products
            }
        } catch {
            print("Error getting: \(error)")
        }
    }
}
