//
//  ContentView.swift
//  NetworkRequestAPI
//
//  Created by Shakhnoza Mirabzalova on 12/10/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @StateObject var viewModel = CatInfoViewModel()
    @Query private var catNotes: [CatData]
    
    var body: some View {
        NavigationStack {
            Text("Adorable Cats")
            
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(viewModel.catInfo, id: \.id) { cat in
                        let note = catNotes.first { $0.id == cat.id }
                        ScrollView {
                            HStack(alignment: .top) {
                                AsyncImage(url: URL(string: cat.image)) { image in
                                    image.image?
                                        .resizable()
                                        .clipShape(Circle())
                                        .frame(width: 120, height: 120)
                                        .padding(.trailing)
                                }
                                
                                VStack {
                                    Text("height: \(cat.height)")
                                    Text("width: \(cat.width)")
                                    Text("Notes: \(note?.note ?? "No note")")
//                                    if let note = catNotes.first(where: { $0.id == cat.id }) {
//                                        Text("Note: \(note.note)")
//                                    } else {
//                                        Text("Note: None")
//                                    }
                                }
                            }
                        }
                    }
                    .frame(width: 400, height: 150)
                }
                .toolbar {
                    NavigationLink(destination: AddNotesView(), label: {
                        Text("Add Note")
                    })
                }
                .task {
                    await viewModel.getInfo()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
