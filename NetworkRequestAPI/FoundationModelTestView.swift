//
//  FoundationModelTestView.swift
//  NetworkRequestAPI
//
//  Created by Shakhnoza Mirabzalova on 12/25/25.
//

import SwiftUI
import FoundationModels
import Translation
// https://developer.apple.com/videos/play/wwdc2024/10117/

@available(iOS 18.0, *)
struct FoundationModelTestView: View {
    @State private var input = ""
    @State private var output = ""
//    var sourceText: String
    @State var text = "This is a translation"
    @State private var targetText: String?
    @State var configuration: TranslationSession.Configuration?
    
    
    var body: some View {
        VStack {
            ScrollView {
                
                Text(text)
                
                Button {
                    self.performTranslation()
                } label : {
                    Text("Translate")
                }
                    .translationTask(configuration) { session in
                        do {
                            let response = try await session.translate(text)
                            self.text = response.targetText
                        } catch {
                            
                        }
                    }
                
                TextField("Ask Question", text: $input)
                    .padding()
                    .onSubmit {
                        ask()
                    }
                Text(output)
                    .multilineTextAlignment(.leading)
                
                Button("Get Answer") {
                    ask()
                }
            }
        }
    }
    
    private func performTranslation() {
        if configuration == nil {
            configuration = TranslationSession.Configuration(
                source: nil,
                target: Locale.Language(languageCode: .polish)
            )
        } else {
            self.configuration?.invalidate()
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
    if #available(iOS 18.0, *) {
        FoundationModelTestView()
    } else {
        // Fallback on earlier versions
    }
}
