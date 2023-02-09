//
//  DetailView.swift
//  easy repo search
//
//  Created by Hans Wage on 06/02/2023.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.openURL) var openURL
    
    let gitHubItem: GitHubItem?
    
    var body: some View {
        // Retrieving a 2x account image, so it will look good on retina
        let resizedImage = GitHubHelpers.setAvatarSize(
            withUrl: gitHubItem?.owner?.avatarUrl,
            size: 280)
        
        VStack(spacing: 20) {
            AsyncImage(url: URL(string: resizedImage), scale: 2.0)
                .scaledToFill()
                .frame(width: 140, height: 140)
                .clipShape(Circle())
                .foregroundColor(Color.black)
            
            Text(gitHubItem?.owner?.login ?? "")
                .font(.title)
            
            Text(gitHubItem?.repositoryDescription ?? "")
                .font(.subheadline)
                .multilineTextAlignment(.center)
            
            DetailsCounterView(systemIcon: "eye", counterName: "watchers", counterValue: gitHubItem?.watchersCount)
            
            DetailsCounterView(systemIcon: "star", counterName: "stars", counterValue: gitHubItem?.stargazersCount)
            
            DetailsCounterView(systemIcon: "tuningfork", counterName: "forks", counterValue: gitHubItem?.forksCount)
            
            HStack {
                Spacer()
                
                Image(systemName: gitHubItem?.privateRepository ?? false ? "lock" : "globe.asia.australia.fill")
                    .frame(width: 30)
            }
            
            Spacer()
            
            Button (action: openRepositoryAction) {
                Text("Open this repository")
            }
            .buttonStyle(.bordered)

        }
        .padding(20)
        .navigationTitle(gitHubItem?.name ?? "")
    }
    
    /**
     This button action will open the repository linked to this GitHub item.
     */
    private func openRepositoryAction() {
        guard let urlString = gitHubItem?.repositoryUrl, let url = URL(string: urlString) else {
            return
        }
        
        openURL(url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(gitHubItem: nil)
    }
}
