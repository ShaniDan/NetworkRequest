//
//  CatData.swift
//  NetworkRequestAPI
//
//  Created by Shakhnoza Mirabzalova on 12/16/25.
//

import Foundation
import SwiftData
import Combine

@Model

class CatData: Identifiable {
    @Attribute(.unique) var id: String = UUID().uuidString
    var note: String
    
    init(id: String = UUID().uuidString, note: String) {
        self.id = id
        self.note = note
    }
}

class CatDataStore: ObservableObject {
    @Published var catData: [CatData] = []
    
}
