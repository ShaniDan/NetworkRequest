//
//  CatInfoViewModel.swift
//  NetworkRequestAPI
//
//  Created by Shakhnoza Mirabzalova on 12/10/25.
//

// Need to use @Observable if I'm using async await concurrency

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
            
            // both conditions must be true, if it's not it doesn't compile
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                throw URLError(.badServerResponse)
            }
            
            let decodedData = try JSONDecoder().decode([CatInfo].self, from: data)
            
            catInfo = decodedData
            // type of response is URLResponse and we are casting URLResponse(response) to HTTPURLResponse data type
            
            
//            let res = response as? HTTPURLResponse
//            // this code would work
//            if res?.statusCode == 200 {
//                // sucessful
//                print("request is successful")
//            } else {
//                throw URLError(.badServerResponse)
//            }
            
        } catch {
            print("Couldn't decode contents \(Error.self)")
        }
    }
}
