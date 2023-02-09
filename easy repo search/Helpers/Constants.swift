//
//  Constants.swift
//  easy repo search
//
//  Created by Hans Wage on 07/02/2023.
//

import Foundation

struct Constants {
    struct Keys {
        static let KEY_GITHUB_ID = "GITHUB_KEY"
    }
    
    struct GitHub {
        private static let GITHUB_BASE_URL = "https://api.github.com/"
        
        static let GITHUB_SEARCH_URL = GITHUB_BASE_URL + "search/repositories?q=%@"
    }
}
