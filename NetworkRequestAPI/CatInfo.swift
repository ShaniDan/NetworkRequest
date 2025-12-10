//
//  CatInfo.swift
//  NetworkRequestAPI
//
//  Created by Shakhnoza Mirabzalova on 12/10/25.
//

import Foundation

struct CatInfo: Codable, Identifiable {
    let id: String
    let image: String
    let width: Int
    let height: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case image = "url"
        case width
        case height
    }
}
