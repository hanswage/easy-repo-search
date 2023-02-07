//
//  GitHubOwner.swift
//  easy repo search
//
//  Created by Hans Wage on 07/02/2023.
//

import Foundation

struct GitHubOwner: Codable {
    let login: String?
    let avatarUrl: String?
    let userUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case login
        case avatarUrl = "avatar_url"
        case userUrl = "html_url"
    }
}
