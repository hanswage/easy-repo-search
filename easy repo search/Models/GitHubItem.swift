//
//  GitHubItem.swift
//  easy repo search
//
//  Created by Hans Wage on 07/02/2023.
//

import Foundation

struct GitHubItem: Codable, Hashable {
    let name: String?
    let fullName: String?
    let repositoryDescription: String?
    let privateRepository: Bool?
    let owner: GitHubOwner?
    let repositoryUrl: String?
    let stargazersCount: Int?
    let watchersCount: Int?
    let forksCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case name
        case fullName = "full_name"
        case repositoryDescription = "description"
        case privateRepository = "private"
        case owner
        case repositoryUrl = "html_url"
        case stargazersCount = "stargazers_count"
        case watchersCount = "watchers_count"
        case forksCount = "forks_count"
    }
}
