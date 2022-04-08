//
//  User.swift
//  GHFollowers
//
//  Created by Jas Lamba on 2022-03-13.
//

import Foundation

struct User: Codable {
    var login: String
    var avatarUrl: String
    var name: String?
    var location: String?
    var bio: String?
    var publicRepos: Int
    var publicGists: Int
    var htmlUrl: String
    var following: Int
    var followers: String
    var createdAt: String
}
