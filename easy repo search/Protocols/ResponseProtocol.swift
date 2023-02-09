//
//  ResponseProtocol.swift
//  easy repo search
//
//  Created by Hans Wage on 09/02/2023.
//

import Foundation

protocol ResponseProtocol {
    /**
     Overrides the default behaviour for dataTaskPublisher, so it can be mocked for testing purposes
     */
    func dataTaskPublisher(for request: URLRequest) -> URLSession.DataTaskPublisher
}
