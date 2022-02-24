//
//  UsersGroupsAPI.swift
//  VK_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 16.12.2021.
//

//https://api.vk.com/method/METHOD?PARAMS&access_token=TOKEN&v=V

import Foundation
import Alamofire
import RealmSwift
import SwiftyJSON


final class UsersGroupsAPI {
    
    let baseUrl = "https://api.vk.com/method"
    let accessToken = Session.shared.token
    let userId = Session.shared.userId
    let version = Session.shared.version
    
    //    MARK: - DTO
    func getUsersGroups(completion: @escaping([UsersGroups])->()) {
        
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
            print(response.data?.prettyJSON)
            
            guard let jsonData = response.data else { return }
            
            do {
                let usersGroupContainer = try JSONDecoder().decode(UsersGroupContainer.self, from: jsonData)
                
                let groups = usersGroupContainer.response.items
                
                completion(groups)
            } catch {
                print(error)
            }
        }
    }
    
//    MARK: - DAO
    func getUsersGroups2(completion: @escaping([UsersGroupsDAO])->()) {

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
            print(response.data?.prettyJSON)
            
            guard let jsonData = response.data else { return }
            
            do {
                let itemsData = try JSON(jsonData)["response"]["items"].rawData()
                let groups = try JSONDecoder().decode([UsersGroupsDAO].self, from: itemsData)
                
                completion(groups)
            } catch {
                print(error)
            }
        }
    }
    
   
}
