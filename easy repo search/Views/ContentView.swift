//
//  ContentView.swift
//  easy repo search
//
//  Created by Hans Wage on 06/02/2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var gitHubViewModel = GitHubViewModel()
    
    var body: some View {
        NavigationStack {
            if let items = gitHubViewModel.gitHubItems, items.count == 0 {
                // This text shows up only if no items were found
                Text("No repositories found, please search again.")
                    .font(.system(size: 14))
                    .bold()
            }
            
            List(gitHubViewModel.gitHubItems ?? [], id: \.self) { item in
                NavigationLink {
                    DetailView(gitHubItem: item)
                } label: {
                    RepoCellView(gitHubItem: item)
                }
            }
            .navigationTitle("Easy Repo search")
        }
        .searchable(text: $gitHubViewModel.searchQuery, prompt: "Search for user or repository name")
        .textInputAutocapitalization(.never)
        .onReceive(
            // Search for repositories with a 2 second throttle, preventing too many api requests.
            gitHubViewModel.$searchQuery.throttle(
                for: 2,
                scheduler: RunLoop.main,
                latest: true)
        ) {
            gitHubViewModel.searchGitHub(withQuery: $0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
