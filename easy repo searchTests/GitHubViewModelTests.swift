//
//  GitHubViewModelTests.swift
//  easy repo searchTests
//
//  Created by Hans Wage on 08/02/2023.
//

import XCTest
@testable import easy_repo_search

final class GitHubViewModelTests: XCTestCase {
    var gitHubViewModel: GitHubViewModel!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        gitHubViewModel = GitHubViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testFetchCorrectDataStructure() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        self.measure {
            // Put the code you want to measure the time of here.
        }
        
        // TODO: Implement test
        XCTAssertTrue(false)
    }
    
    func testFetchIncorrectDataStructure() throws {
        // TODO: Implement test
        XCTAssertTrue(false)
    }
    
    func testFetchEmptyData() throws {
        // TODO: Implement test
        XCTAssertTrue(false)
    }
}
