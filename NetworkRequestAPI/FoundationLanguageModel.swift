//
//  FoundationLanguageModel.swift
//  NetworkRequestAPI
//
//  Created by Shakhnoza Mirabzalova on 12/25/25.
//

import Foundation
import FoundationModels



@available(iOS 26.0, *)
struct LLMService {
    let session = LanguageModelSession()
    
    func respond(to prompt: String) async throws -> String {
        let response = try await session.respond(to: prompt)
        return String(describing: response)
    }
}

