//
//  ResponseDataPublisherMock.swift
//  easy repo search
//
//  Created by Hans Wage on 09/02/2023.
//

import Foundation

class ResponseDataPublisherMock: ResponseProtocol {
    func dataTaskPublisher(for request: URLRequest) -> URLSession.DataTaskPublisher {
        guard let url = request.url else {
            // We received an invalid url. Return the default response, making our test fail as intended.
            return URLSession.shared.dataTaskPublisher(for: request)
        }
        
        // This function replaces the regular url request with a local file, so we can moch the response.
        let dummyJsonFileName = url.lastPathComponent
        var dummyJsonAddition = ""
        
        if let components = URLComponents(string: url.absoluteString) {
            // For our mock, we want to include the query itself, to specify what kind of mock json we want.
            dummyJsonAddition = components.queryItems?.first(where: { $0.name == "q" })?.value ?? ""
        }
        
        // Put the full file name together
        let fullDymmyUrl = String.init(format: "%@-%@", dummyJsonFileName, dummyJsonAddition)
        let jsonFile = Bundle(for: type(of: self)).url(forResource: fullDymmyUrl, withExtension: "json")!
        
        // Return the replaced publisher task
        return URLSession.shared.dataTaskPublisher(for: jsonFile)
    }
}
