//
//  UsersGroupsPostService.swift
//  VK_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 10.02.2022.
//

import Foundation
import PromiseKit
import Alamofire
import SwiftyJSON
import RealmSwift

class UsersGroupsPromiseService {
    
    let baseUrl = "https://api.vk.com/method"
    let accessToken = Session.shared.token
    let userId = Session.shared.userId
    let version = "5.131"
    
    init () {
        
        Realm.Configuration.defaultConfiguration = Realm.Configuration(schemaVersion: 3)
    }
    
    func getUsersGroups() -> Promise<[UsersGroupsDAO]>{
        return Promise<[UsersGroupsDAO]> {seal in
            
            
            let method = "/groups.get"
            let parameters: [String : String] = [
                "user_id": userId,
                "extended": "1",
                "fields": "activity, can_create_topic, can_post, can_see_all_posts, city, contacts;, counters, country, description, finish_date, fixed_post, links, members_count, place, site, start_date, status, verified, wiki_page",
                "count": "50",
                "access_token": accessToken,
                "v": version
            ]
            
            let url = baseUrl + method
            
            AF.request(url, method: .get, parameters: parameters).responseJSON {response in
                
                print("вызов групп пользователя")
                //            print( response.result)
                print(response.data?.prettyJSON ?? "ошибка загрузки данных")
                
                if let error = response.error {
                    seal.reject(error)
                }
                if let jsonData = response.data {
                    
                    do {
                        let itemsData = try JSON(jsonData)["response"]["items"].rawData()
                        let groups = try JSONDecoder().decode([UsersGroupsDAO].self, from: itemsData)
                        seal.fulfill(groups)
                    } catch {
                        seal.reject(error)
                    }
                }
            }
        }
    }
    
    // MARK: - saveUsersGroupsData
    func saveUsersGroupsData (_ groups: [UsersGroupsDAO]) {
        
        do {
            let realm = try Realm()
            print("ПУТЬ К РЕАЛМУ")
            print(realm.configuration.fileURL ?? "Путь к базе Realme отсутствует")
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
    func deleteUsersGroupsData(_ groups: [UsersGroupsDAO]) {
        do {
            let realm = try Realm()
            let oldItems = realm.objects(UsersGroupsDAO.self)
            try realm.write{
                realm.delete(oldItems)
            }
        } catch {
            print(error)
        }
    }
    
}
