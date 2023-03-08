//
//  PersistenceManager.swift
//  GHF
//
//  Created by Jaron Grigsby on 3/2/23.
//

import Foundation

enum PersistanceActionType {
   case add, remove
}

enum PersistenceManager {
   
   static private let defaults = UserDefaults.standard
   enum Keys { static let favorites = "Favorites" }
   

   static func updateWith(favorite: Follower, actionType: PersistanceActionType, completion: @escaping (GFError?)-> Void) {
      retrieveFavorites { result in
         switch result {
         case .success(var retrievedFavorites):
            
            switch actionType {
            case .add:
               guard !retrievedFavorites.contains(favorite) else {
                  completion(.alreadyInFavorites)
                  return
               }
               
               retrievedFavorites.append(favorite)
            
            case .remove:
               retrievedFavorites.removeAll { $0 == favorite }
            }
            
            completion(save(favorites: retrievedFavorites))
            
         case .failure(let error):
            completion(error)
         }
      }
   }
   
   
   static func retrieveFavorites(completion: @escaping (Result<[Follower], GFError>) -> Void) {
      guard let favoritesData = defaults.object(forKey: Keys.favorites) as? Data else {
         completion(.success([]))
         return
      }
      
      do {
         let decoder = JSONDecoder()
         let favorites = try decoder.decode([Follower].self, from: favoritesData)
         completion(.success(favorites))
      } catch {
         completion(.failure(.unableToFavorite))
      }
   }
   
   
   static func save(favorites: [Follower]) -> GFError? {
      do {
         let encoder = JSONEncoder()
         let encodedFavorites = try encoder.encode(favorites)
         defaults.set(encodedFavorites, forKey: Keys.favorites)
         return nil
      } catch {
         return .unableToFavorite
      }
   }
}
