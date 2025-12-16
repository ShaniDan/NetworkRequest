//
//  AddNotesView.swift
//  NetworkRequestAPI
//
//  Created by Shakhnoza Mirabzalova on 12/15/25.
//

import SwiftUI
import SwiftData

struct AddNotesView: View {
    @State var note = ""
    @Query private var catNotes: [CatData]
    @Environment(\.modelContext) private var context
    
    
    var body: some View {
        TextField("Add a note", text: $note)
        
        Button("Save") {
            // Assigning a new note to savedNode
            let savedNote = CatData(note: note)
            // adding the savedNote to the modelContext
            context.insert(savedNote)
            //
            do {
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    AddNotesView()
}
