//
//  ProductList.swift
//  DemoListApp
//
//  Created by Bhagwant Sangvikar on 02/05/23.
//

import SwiftUI

struct ProductList: View {
    @StateObject var vm: ProductListViewModel = ProductListViewModel()
    
    var body: some View {
        VStack {
            if let products = vm.productList {
                List{
                    ForEach(products) { product in
                        NavigationLink {
                            DetailView(vm: ProductRowViewModel(product: product))
                        } label: {
                            ProductListRow(vm: ProductRowViewModel(product: product))
                        }
                    }
                    
                }
                .navigationTitle("List Screen")
            }
        }
    }
}

struct ProductList_Previews: PreviewProvider {
    static var previews: some View {
        ProductList()
    }
}
