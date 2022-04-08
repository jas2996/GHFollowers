//
//  Follower.swift
//  GHFollowers
//
//  Created by Jas Lamba on 2022-03-13.
//

import Foundation

struct Follower: Codable {
    // when you conform to the codable protocol you get both encodable and decodable
    var login: String
    var avatarUrl: String
}
