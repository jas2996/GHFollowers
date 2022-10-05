//
//  PersistenceManager.swift
//  GHFollowers
//
//  Created by Jas Lamba on 2022-09-16.
//

import Foundation

enum PersistenceActionType {
    case add, remove
}

enum PersistenceManager {
    static private let defaults = UserDefaults.standard
    
    enum Keys {
        static let favorites = "favorites"
    }
    
    static func updateWith(favourite: Follower, actionType: PersistenceActionType, completed: @escaping (GFError?) -> Void ) {
        retrieveFavorites { result in
            switch result {
            case.success(var favorites):
                
                switch actionType {
                case .add:
                    guard !favorites.contains(favourite) else {
                        completed(.alredyInFavorites)
                        return
                    }
                    
                    favorites.append(favourite)
                case .remove:
                    favorites.removeAll  { $0.login == favourite.login }
                }
                
                completed(save(favourites: favorites))
            case .failure(let error):
                completed(error)
            }
        }
    }
    
    static func retrieveFavorites(completed: @escaping (Result<[Follower], GFError>) -> Void) {
        guard let favoritesData = defaults.object(forKey: Keys.favorites) as? Data else {
            completed(.success([]))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            //decoder takes data from the server and decodes it so we can use it
            //encoder takes data from our app and encodes it for the server
            
            let favorites = try decoder.decode([Follower].self, from: favoritesData)
            // use dot self cause your showing the type here
            completed(.success(favorites))
            // now we pass followers in completed block and because everything is fine we pass nil for error
        } catch {
            completed(.failure(.unableToFavorite))
        }
    }
    
    static func save(favourites: [Follower]) -> GFError? {
        do {
            let encoder = JSONEncoder()
            let encodedFavorites = try encoder.encode(favourites)
            
            defaults.set(encodedFavorites, forKey: Keys.favorites)
            return nil
        } catch {
            return .unableToFavorite
        }
    }
}
