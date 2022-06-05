//
//  User.swift
//  GHFollowers
//
//  Created by Jas Lamba on 2022-03-13.
//

import Foundation

struct User: Codable {
    let login: String
    let avatarUrl: String
    var name: String?
    var location: String?
    let bio: String?
    let publicRepos: Int
    let publicGists: Int
    let htmlUrl: String
    let following: Int
    let followers: String
    let createdAt: String
}
