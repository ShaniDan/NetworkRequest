//
//  CatInfoViewModel.swift
//  NetworkRequestAPI
//
//  Created by Shakhnoza Mirabzalova on 12/10/25.
//

import Foundation
import Combine

class CatInfoViewModel: ObservableObject {
    
    @Published var catInfo: [CatInfo] = []
    
    func getInfo() async {
        
        let endPoint = "https://api.thecatapi.com/v1/images/search?limit=10"
        
        guard let url = URL(string: endPoint) else {
            print("Not valid url \(Error.self)")
            return
        }
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            let decodedData = try JSONDecoder().decode([CatInfo].self, from: data)
            
            catInfo = decodedData
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                throw URLError(.badServerResponse)
            }
        } catch {
            print("Couldn't decode contents \(Error.self)")
        }
    }
}
