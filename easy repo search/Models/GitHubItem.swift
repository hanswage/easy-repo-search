//
//  GitHubItem.swift
//  easy repo search
//
//  Created by Hans Wage on 07/02/2023.
//

import Foundation

struct GitHubItem: Codable {
    let fullName: String?
    let privateRepository: Bool?
    let owner: GitHubOwner?
    let repositoryUrl: String?
    let stargazersCount: Int?
    let watchersCount: Int?
    let forksCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case fullName = "full_name"
        case privateRepository = "private"
        case owner
        case repositoryUrl = "html_url"
        case stargazersCount = "stargazers_count"
        case watchersCount = "watchers_count"
        case forksCount = "forks_count"
    }
}
