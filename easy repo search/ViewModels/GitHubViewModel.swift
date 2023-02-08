//
//  GitHubViewModel.swift
//  easy repo search
//
//  Created by Hans Wage on 07/02/2023.
//

import Foundation
import Combine

class GitHubViewModel : ObservableObject {
    @Published public var searchQuery: String = ""
    @Published var gitHubItems: [GitHubItem] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    func searchGitHub(withQuery query: String) {
        let gitHubUrl = String.init(format: Constants.GitHub.GITHUB_SEARCH_URL, query)
        
        guard let url = URL(string: gitHubUrl), let apiId = getApiId() else {
            return
        }
        
        cancelAll()
        
        // Adding a bearer token to our request, so we can make up to 30 requests per minute
        let bearerToken = String.init(format: "Bearer: %@", apiId)
        var urlRequest = URLRequest(url: url)
        
        urlRequest.setValue(bearerToken, forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared
            .dataTaskPublisher(for: urlRequest)
            .tryMap { data, response in
                // throw error when bad server response is received
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                
                return data
            }
            .decode(type: GitHubSearch.self, decoder: JSONDecoder())
            .map { $0.items }
            .replaceError(with: [])
            .eraseToAnyPublisher()
            .receive(on: RunLoop.main)
            .assign(to: \GitHubViewModel.gitHubItems, on: self)
        
        cancellables.insert(task)
    }
    
    private func cancelAll() {
        for cancellable in cancellables {
            cancellable.cancel()
        }
    }
    
    /**
     Retrieve the Api ID from our info file, that is linked to our .xcconfig files.
     
     - Returns: The Api ID. If none is found, this variable will be nil.
     */
    private func getApiId() -> String? {
        return Bundle.main.infoDictionary?[Constants.Keys.KEY_GITHUB_ID] as? String
    }
}
