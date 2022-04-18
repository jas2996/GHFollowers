//
//  Follower.swift
//  GHFollowers
//
//  Created by Jas Lamba on 2022-03-13.
//

import Foundation

struct Follower: Codable, Hashable {
    // when you conform to the codable protocol you get both encodable and decodable
    var login: String
    var avatarUrl: String
    
//    MARK: - Only if you want one of the item to be hashale
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(login)
//    }
}
