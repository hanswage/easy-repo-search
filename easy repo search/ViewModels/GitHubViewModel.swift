//
//  GitHubViewModel.swift
//  easy repo search
//
//  Created by Hans Wage on 07/02/2023.
//

import Foundation
import Combine

class GitHubViewModel : ObservableObject {
    // The user's search query
    @Published public var searchQuery: String = ""
    // The retrieved repositories
    @Published public var gitHubItems: [GitHubItem]?
    
    // A Set of tasks, that can be canceled if required.
    private var cancellables = Set<AnyCancellable>()
    // The used response publisher, enabling mocking for testing purposes.
    private let responseDataPublisher: ResponseProtocol
    
    init(responseDataPublisher: ResponseProtocol = ResponseDataPublisher(session: URLSession.shared)) {
        self.responseDataPublisher = responseDataPublisher
    }
    
    /**
     Search GitHub for repositories by owner name or repository name.
     
     - parameter query: A String that will be passed to the API to search for.
     */
    func searchGitHub(withQuery query: String) {
        let gitHubUrl = String.init(format: Constants.GitHub.GITHUB_SEARCH_URL, query)
        
        guard let url = URL(string: gitHubUrl), let apiId = getApiId(), query.count > 0 else {
            // The url is incorrect or the search query is empty, return to our default state.
            gitHubItems = nil
            
            return
        }
        
        cancelAll()
        
        // Adding a bearer token to our request, so we can make up to 30 requests per minute
        let bearerToken = String.init(format: "Bearer: %@", apiId)
        var urlRequest = URLRequest(url: url)
        
        urlRequest.setValue(bearerToken, forHTTPHeaderField: "Authorization")
        
        // Retrieve repositories and parse them into a GitHubSearch model.
        responseDataPublisher
            .dataTaskPublisher(for: urlRequest)
            .tryMap { data, response in
                return data
            }
            .decode(type: GitHubSearch.self, decoder: JSONDecoder())
            .map { $0.items }
            .replaceError(with: [])
            .eraseToAnyPublisher()
            .receive(on: RunLoop.main)
            .assign(to: \GitHubViewModel.gitHubItems, on: self)
            .store(in: &cancellables)
    }
    
    /**
     Cancels all currently running requests, preventing loading data twice.
     */
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
