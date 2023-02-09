//
//  GitHubViewModelTests.swift
//  easy repo searchTests
//
//  Created by Hans Wage on 08/02/2023.
//

import XCTest
import Combine
@testable import easy_repo_search

final class GitHubViewModelTests: XCTestCase {
    var responseMock: ResponseDataPublisherMock!
    var gitHubViewModel: GitHubViewModel!
    var expectation: XCTestExpectation!
    var cancelSet: Set<AnyCancellable> = []
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        responseMock = ResponseDataPublisherMock()
        gitHubViewModel = GitHubViewModel(responseDataPublisher: responseMock)
        expectation = self.expectation(description: "Waiting for items to be set")
        
        gitHubViewModel.$gitHubItems
            .sink { response in
                guard response != nil else { return }
                
                // The data was not nil this time, fulfill the expectation
                self.expectation.fulfill()
            }
            .store(in: &cancelSet)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        responseMock = nil
        gitHubViewModel = nil
    }
    
    func testFetchCorrectDataStructure() throws {
        gitHubViewModel.searchGitHub(withQuery: "correct")
        
        // Wait for a maximum of 1 second or until fulfill has been called to ensure the data has been set.
        wait(for: [expectation], timeout: 1)
        
        // In our mock, there is only 1 value, check if it is true and owner was set.
        XCTAssertEqual(gitHubViewModel.gitHubItems?.count, 1)
        XCTAssertNotNil(gitHubViewModel.gitHubItems?[0].owner)
    }
    
    func testFetchIncorrectDataStructure() throws {
        gitHubViewModel.searchGitHub(withQuery: "missingOwner")
        
        // Wait for a maximum of 1 second or until fulfill has been called to ensure the data has been set.
        wait(for: [expectation], timeout: 1)
        
        // In our mock, there is only 1 value, check if it is true, but owner is nil.
        XCTAssertEqual(gitHubViewModel.gitHubItems?.count, 1)
        XCTAssertNil(gitHubViewModel.gitHubItems?[0].owner)
    }
    
    func testFetchEmptyData() throws {
        gitHubViewModel.searchGitHub(withQuery: "missingItems")
        
        // Wait for a maximum of 1 second or until fulfill has been called to ensure the data has been set.
        wait(for: [expectation], timeout: 1)
        
        // We expect no values, but a well set empty array.
        XCTAssertEqual(gitHubViewModel.gitHubItems?.count, 0)
        XCTAssertNotNil(gitHubViewModel.gitHubItems)
    }
}
