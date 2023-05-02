//
//  FavouritesList.swift
//  DemoListApp
//
//  Created by Bhagwant Sangvikar on 03/05/23.
//

import SwiftUI

struct FavouritesList: View {
    @State var vm: ProductListViewModel = ProductListViewModel()
    
    var body: some View {
        VStack {
            if let products = vm.productList {
                List{
                    ForEach(products) { product in
                        FavouriteListRow(vm: ProductRowViewModel(product: product))
                    }
                }
                .navigationTitle("Favourite List")
            }
        }
    }
}

struct FavouritesList_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesList()
    }
}
