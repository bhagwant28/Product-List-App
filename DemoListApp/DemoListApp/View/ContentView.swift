//
//  ContentView.swift
//  DemoListApp
//
//  Created by Bhagwant Sangvikar on 02/05/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isStart = false
    
    var body: some View {
        VStack {
            Image(systemName: "popcorn.circle")
                .resizable()
                .frame(width: 120, height: 120)
                .foregroundColor(Color.mint)
            Text("Welcome to the App")
                .font(.title)
            buttonView()
        }
        .padding()
        .navigationDestination(isPresented: $isStart) {
            HomeTabView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView {
    func buttonView()-> some View {
        Button {
            isStart.toggle()
        } label: {
            HStack {
                Image(systemName: "arrowshape.right")
                Text("Start App")
            }
            .foregroundColor(.white)
            .frame(width: 180, height: 44)
            .background(Color.green)
            .cornerRadius(12)
            .shadow(radius: 8)
        }
        .padding(.top, 40)
    }
}
