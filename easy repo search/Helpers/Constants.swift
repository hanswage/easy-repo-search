//
//  Constants.swift
//  easy repo search
//
//  Created by Hans Wage on 07/02/2023.
//

import Foundation

struct Constants {
    struct GitHub {
        private static let GITHUB_BASE_URL = "https://api.github.com/"
        
        static let GITHUB_SEARCH_URL = GITHUB_BASE_URL + "search/repositories?q=%@"
    }
}
