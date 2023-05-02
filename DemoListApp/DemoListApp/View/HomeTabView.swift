//
//  HomeTabView.swift
//  DemoListApp
//
//  Created by Bhagwant Sangvikar on 03/05/23.
//

import SwiftUI

struct HomeTabView: View {
    private var imageSize: CGFloat = 100
    
    @State private var isStart = false
    @StateObject var vm: ProductListViewModel = ProductListViewModel()
    
    var body: some View {
        if vm.productList?.count == 0 {
            ProgressView()
                .frame(width: imageSize, height: imageSize) //as placehoder
        } else {
            TabView {
                ProductList()
                    .tabItem {
                        Text("Product List")
                        Image(systemName: "house")
                    }
                
                FavouritesList()
                    .tabItem {
                        Text("Favourite")
                        Image(systemName: "star.fill")
                    }
            }

        }
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
    }
}
