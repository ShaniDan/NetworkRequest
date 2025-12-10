//
//  ContentView.swift
//  NetworkRequestAPI
//
//  Created by Shakhnoza Mirabzalova on 12/10/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = CatInfoViewModel()
    
    var body: some View {
        
        Text("Adorable Cats")
        
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(viewModel.catInfo) { cat in
                    ScrollView {
                        HStack(alignment: .top) {
                            AsyncImage(url: URL(string: cat.image)) { image in
                                image
                                    .image?.resizable()
                                    .clipShape(Circle())
                                    .frame(width: 120, height: 120)
                                    .padding(.trailing)
                            }
                                                    
                            VStack {
                                Text("height: \(cat.height)")
                                Text("width: \(cat.width)")
                            }
                        }
                    }
                }
                .frame(width: 400, height: 150)
            }
            .task {
                await viewModel.getInfo()
            }
        }
    }
}

#Preview {
    ContentView()
}
