//
//  GitHubHelpers.swift
//  easy repo search
//
//  Created by Hans Wage on 08/02/2023.
//

import Foundation

class GitHubHelpers {
    private init() { }
    
    public static func setAvatarSize(withUrl url: String?, size: Int) -> String {
        guard let avatarUrl = url, avatarUrl != "", size > 0 else {
            return ""
        }
        
        return String.init(format: "%@&s=%d", avatarUrl, size)
    }
}
