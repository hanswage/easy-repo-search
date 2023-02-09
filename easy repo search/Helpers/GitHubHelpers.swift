//
//  GitHubHelpers.swift
//  easy repo search
//
//  Created by Hans Wage on 08/02/2023.
//

import Foundation

class GitHubHelpers {
    private init() { }
    
    /**
     Resizes the user's avatar, by adding extra variables to the url.
     
     - parameter url: The url as it is returned by the GitHub API.
     - parameter size: The requested size in pixels.
     
     - returns: A String representation of the url, resized.
     */
    public static func setAvatarSize(withUrl url: String?, size: Int) -> String {
        guard let avatarUrl = url, avatarUrl != "", size > 0 else {
            return ""
        }
        
        return String.init(format: "%@&s=%d", avatarUrl, size)
    }
}
