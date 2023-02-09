//
//  easy_repo_searchTests.swift
//  easy repo searchTests
//
//  Created by Hans Wage on 06/02/2023.
//

import XCTest
@testable import easy_repo_search

final class easy_repo_searchTests: XCTestCase {
    var baseImageUrl: String!
    
    override func setUpWithError() throws {
        baseImageUrl = "https://www.example.com/image?v=4"
    }

    override func tearDownWithError() throws {
        // This method is a singleton, no tear down required.
    }
    
    func testResizedImage() throws {
        let result = GitHubHelpers.setAvatarSize(withUrl: baseImageUrl, size: 80)
        
        XCTAssertEqual(result, String.init(format: "%@&s=80", baseImageUrl))
    }
    
    func testEmptyUrl() throws {
        var result = GitHubHelpers.setAvatarSize(withUrl: nil, size: 80)
        
        XCTAssertEqual(result, "")
        
        result = GitHubHelpers.setAvatarSize(withUrl: "", size: 80)
        
        XCTAssertEqual(result, "")
    }
    
    func testNegativeNumber() throws {
        let result = GitHubHelpers.setAvatarSize(withUrl: nil, size: -1)
        
        XCTAssertEqual(result, "")
    }
    
    func testZeroNumber() throws {
        let result = GitHubHelpers.setAvatarSize(withUrl: nil, size: 0)
        
        XCTAssertEqual(result, "")
    }
}
