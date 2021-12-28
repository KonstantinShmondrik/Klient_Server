//
//  UsersGroupsDB.swift
//  VK_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 28.12.2021.
//

import Foundation
import Alamofire
import RealmSwift
import SwiftyJSON

final class UsersGroupsDB {
    
    init () {
        
        Realm.Configuration.defaultConfiguration = Realm.Configuration(schemaVersion: 2)
    }
        // MARK: - saveUsersGroupsData
        func saveUsersGroupsData (_ groups: [UsersGroupsDAO]) {
            
            do {
                
                let realm = try Realm()
                
                print("ПУТЬ К РЕАЛМУ")
                print(realm.configuration.fileURL)
                
                try realm.write{
                    realm.add(groups)
                }
                
            } catch {
                print(error)
            }
        }
        
        // MARK: - fetchUsersGroupsData
        func fetchUsersGroupsData() -> Results<UsersGroupsDAO> {
           
                
                let realm = try! Realm()
                
                let groups: Results<UsersGroupsDAO> = realm.objects(UsersGroupsDAO.self)
                
                return groups
           
        }
        
        // MARK: - deleteUsersGroupsData
        func deleteFriensdData(_ groups: [UsersGroupsDAO]) {
            do {
                let realm = try Realm()
                try realm.write{
                    realm.delete(groups)
                }
                
            } catch {
                print(error)
            }
        }
        
    // MARK: - deleteAllUsersGroupsData
    func deleteAllUsersGroupsData() {
        do {
            let realm = try Realm()

            
            try realm.write{
                realm.deleteAll()
            }
            
        } catch {
            print(error)
        }
    }
    
}



