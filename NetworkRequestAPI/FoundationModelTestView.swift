//
//  FoundationModelTestView.swift
//  NetworkRequestAPI
//
//  Created by Shakhnoza Mirabzalova on 12/25/25.
//

import SwiftUI
import FoundationModels

struct FoundationModelTestView: View {
    @State private var input = ""
    @State private var output = ""
    var body: some View {
        VStack {
            TextField("Ask Question", text: $input)
                .padding()
                .onSubmit {
                    ask()
                }
            Text(output)
            
            Button("Get Answer") {
                ask()
            }
        }
    }
    
    private func ask() {
        Task {
            do {
                if #available(iOS 26.0, *) {
                    let session = LanguageModelSession()
                    let response = try await session.respond(to: input)
                    // this assigns the actual text
                    output = response.content
                }
            } catch {
                output = "Error: \(error.localizedDescription)"
            }
        }
    }
}

#Preview {
    FoundationModelTestView()
}
