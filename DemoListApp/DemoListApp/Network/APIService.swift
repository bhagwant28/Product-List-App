//
//  APIService.swift
//  DemoListApp
//
//  Created by Bhagwant Sangvikar on 02/05/23.
//

import Foundation

class APIService{

    func fetchAllProducnt() async throws -> (ListModel) {
        guard let url = URL(string: "https://run.mocky.io/v3/2f06b453-8375-43cf-861a-06e95a951328") else { fatalError("Missing URL") }
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
        
//        if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
//            // try to read out a string array
//            //            if let names = json["names"] as? [String] {
//            print("json \(json)")
//            //            }
//        }
        
        let decodedData = try JSONDecoder().decode(ListModel.self, from: data)
 
        return decodedData
    }
}
