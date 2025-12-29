//
//  TodoSample.swift
//  NetworkRequestAPI
//
//  Created by Shakhnoza Mirabzalova on 12/29/25.
//

import SwiftUI

struct TodoSample: View {
    
    @State var list = [String]()
    @State var input = ""
    
    @State var selectedText: Int? = nil
    @State var showUpdate = false
    
    var body: some View {
        VStack {
            
            List {
                ForEach(list.indices, id: \.self) { item in
                    Text(list[item])
                        .onLongPressGesture(perform: {
                            selectedText = item
                            showUpdate = true
                            print("long press clicked")
                        })
                }
                .onDelete { offsets in
                    list.remove(atOffsets: offsets)
                }
            }
            
            TextField("add todo", text: $input)
                .padding()
            Button("Add") {
                add()
            }
        }
        .sheet(isPresented: $showUpdate) {
            if let index = selectedText {
                updateView(text: $list[index])
            } else {
                
            }
        }
    }
    
    func add() {
        list.append(input)
        input = ""
    }
    
    func remove() {
        list.removeAll()
    }
    
    func update() {
        var newInput = ""
        for item in list {
            newInput = item
            print(newInput)
        }
    }
}

#Preview {
    TodoSample()
}

struct updateView: View {
    
    @Binding var text: String
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            VStack(spacing: 12) {
                TextField("Update todo", text: $text)
                    .textFieldStyle(.roundedBorder)
                    .padding()

                Spacer()
            }
            .navigationTitle("Edit Todo")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") { dismiss() }
                }
            }
        }
    }
}
