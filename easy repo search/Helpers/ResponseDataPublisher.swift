//
//  ResponseDataPublisher.swift
//  easy repo search
//
//  Created by Hans Wage on 09/02/2023.
//

import Foundation

class ResponseDataPublisher: ResponseProtocol {
    var session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func dataTaskPublisher(for request: URLRequest) -> URLSession.DataTaskPublisher {
        return session.dataTaskPublisher(for: request)
    }
}
