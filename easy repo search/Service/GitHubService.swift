//
//  GitHubService.swift
//  easy repo search
//
//  Created by Hans Wage on 07/02/2023.
//

import Foundation

class GitHubService : ObservableObject {
    func searchGitHub(withQuery query: String) {
        let gitHubUrl = String.init(format: Constants.GitHub.GITHUB_SEARCH_URL, query)
        
        guard let url = URL(string: gitHubUrl) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("Data object was nil")
                
                return
            }
            
            do {
                let searchResult = try JSONDecoder().decode(GitHubSearch.self, from: data)
                
                print(searchResult.items?.count ?? 0)
            } catch {
                print("Could not parse result")
            }
        }.resume()
    }
}
