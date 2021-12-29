//
//  FriendsDB.swift
//  VK_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 27.12.2021.
//

import Foundation
import RealmSwift

final class FriendsDB {
    
    init () {
        
        Realm.Configuration.defaultConfiguration = Realm.Configuration(schemaVersion: 1)
    }
        // MARK: - saveFriensdData
        func saveFriensdData (_ friends: [FriendDAO]) {
          
            do {
                
                let realm = try Realm()
                
                print("ПУТЬ К РЕАЛМУ")
                print(realm.configuration.fileURL)
            
                try realm.write{
                    realm.add(friends)
                }
                
            } catch {
                print(error)
            }
           
            
//            let realm = try! Realm()
//
//            try! realm.write {
//                realm.add(friends)
//            }
        }
        
        // MARK: - fetchFriensdData
        func fetchFriensdData() -> Results<FriendDAO> {
           
                
                let realm = try! Realm()
                
                let friends: Results<FriendDAO> = realm.objects(FriendDAO.self)
                
                return friends
           
        }
        
        // MARK: - deleteFriensdData
        func deleteFriensdData(_ friends: [FriendDAO]) {
            do {
                let realm = try Realm()
                let oldItems = realm.objects(FriendDAO.self)
                try realm.write{
                    realm.delete(oldItems)
                }
                
            } catch {
                print(error)
            }
        }
            
            // MARK: - deleteAllFriensdData
            func deleteAllFriensdData() {
                
                do {
                    let realm = try Realm()
                   
                    try realm.write{
                        realm.deleteAll()
                    }
                    
                } catch {
                    print(error)
                }
                 
//                let realm = try! Realm()
//
//                try! realm.write {
//                    realm.deleteAll()
//            }
            }
            
            
        
        
    
}


