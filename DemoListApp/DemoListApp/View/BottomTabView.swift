//
//  TabView.swift
//  DemoListApp
//
//  Created by Bhagwant Sangvikar on 02/05/23.
//

import SwiftUI

struct BottomTabView: View {
    var body: some View {
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

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        BottomTabView()
    }
}
