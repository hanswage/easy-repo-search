//
//  ContentView.swift
//  easy repo search
//
//  Created by Hans Wage on 06/02/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var searchQuery = ""
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(searchResults, id: \.self) { name in
                    NavigationLink {
                        DetailView(name: name)
                    } label: {
                        Text(name)
                    }
                }
            }
            .navigationTitle("Easy Repo search")
        }
        .searchable(text: $searchQuery, prompt: "Search for user of repository name")
        .onAppear() {
            // TODO: Remove onAppear, added for testing purposes
            GitHubService().searchGitHub(withQuery: "hans")
        }
    }
    
    // TODO: Placeholder for search results
    var searchResults: [String] = [String]()
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
