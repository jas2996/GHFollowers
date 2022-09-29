//
//  NetworkManager.swift
//  GHFollowers
//
//  Created by Jas Lamba on 2022-03-13.
//

import Foundation
import UIKit

class NetworkManager {
    // singleton class, review pros and cons
    // globally accessible, shared accros the app
    // pros: convenience, use in moderation
    // cons: anywhere in the app can be used to change singleton class, hard to debug, monolith (giant file)
    
    static let shared = NetworkManager() //make it a sharable resource, static means that every network manager if will have this instance
    let baseUrl = "https://api.github.com/users/"
    let cache = NSCache<NSString, UIImage>() //NS stands for NextStep, Steve Jobs company after he got fired from Apple lol
    
    private init() {} // create the singleton
    //without using Result type (Swift 5)
//    func getFollowers(for username: String, page: Int, completed: @escaping ([Follower]?, GFError?) -> Void) {
//        //completion handler, completed, closure used interchanibly
//        //when completed return array of followers and if error return string
//        let endpoint = baseUrl + "\(username)/followers?per_page=100&page=\(page)"
//
//        guard let url = URL(string: endpoint) else {
//            completed(nil, GFError.invalidUsername)
//            return
//        }
//
//        let task = URLSession.shared.dataTask(with: url) { data, response, error in
//            // dot shared is an example of singleton, apple also uses
//            if let _ = error {
//                // completed(follwer, error message)
//                // if error follower will be nil wit some error message
//                completed(nil, GFError.unableToComplete)
//                return
//            }
//
//            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//                // cast response as HTTPURLResponse, and check if response status code is 200, if it's 200 we're good to go
//                completed(nil, GFError.invalidResponse)
//                return
//            }
//
//            guard let data = data else {
//                // if we don't get data
//                completed(nil, GFError.invalidData)
//                return
//            }
//
//            do {
//                let decoder = JSONDecoder()
//                //decoder takes data from the server and decodes it so we can use it
//                //encoder takes data from our app and encodes it for the server
//                decoder.keyDecodingStrategy = .convertFromSnakeCase
//
//                let followers = try decoder.decode([Follower].self, from: data)
//                // use dot self cause your showing the type here
//                completed(followers, nil)
//                // now we pass followers in completed block and because everything is fine we pass nil for error
//            } catch {
//                completed(nil, GFError.invalidData)
//            }
//
//        }
//
//        task.resume() //actually starts the call
//    }
    
    //using Result type (Swift 5)
    func getFollowers(for username: String, page: Int, completed: @escaping (Result<[Follower], GFError>) -> Void) {
        //completion handler, completed, closure used interchanibly
        //when completed return array of followers and if error return string
        let endpoint = baseUrl + "\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidUsername))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            // dot shared is an example of singleton, apple also uses
            if let _ = error {
                // completed(follwer, error message)
                // if error follower will be nil wit some error message
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                // cast response as HTTPURLResponse, and check if response status code is 200, if it's 200 we're good to go
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                // if we don't get data
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                //decoder takes data from the server and decodes it so we can use it
                //encoder takes data from our app and encodes it for the server
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                let followers = try decoder.decode([Follower].self, from: data)
                // use dot self cause your showing the type here
                completed(.success(followers))
                // now we pass followers in completed block and because everything is fine we pass nil for error
            } catch {
                completed(.failure(.invalidData))
            }

        }
        
        task.resume() //actually starts the call
    }
    
    func getUserInfo(for username: String, completed: @escaping (Result<User, GFError>) -> Void) {
        
        // escapting closure can outlive this getUserInfo method, mainly used for async stuff
        let endpoint = baseUrl + "\(username)"
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidUsername))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                decoder.dateDecodingStrategy = .iso8601
                let user = try decoder.decode(User.self, from: data)
                completed(.success(user))
            } catch {
                completed(.failure(.invalidData))
            }

        }
        
        task.resume()
    }
}
