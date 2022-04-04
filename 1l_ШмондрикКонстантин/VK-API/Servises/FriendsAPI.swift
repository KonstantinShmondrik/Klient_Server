//
//  FriendsAPI.swift
//  VK_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 12.12.2021.
//

//https://api.vk.com/method/METHOD?PARAMS&access_token=TOKEN&v=V

import Foundation
import Alamofire
import RealmSwift
import SwiftyJSON

final class FriendsAPI {
    
    let baseUrl = "https://api.vk.com/method"
    let accessToken = Session.shared.token
    let userId = Session.shared.userId
    let version = Session.shared.version
   
    
    func getFriends(completion: @escaping([Friend])->()) {
                    
        let method = "/friends.get"
        let parameters: [String: String] = [
            "user_id": userId,
            "order": "name",
            "count": "1000",
            "fields": "photo_200, photo_100, photo_50, city, domain",
            "access_token": accessToken,
            "v": version
        ]
            
        let url = baseUrl + method
        
        AF.request(url, method: .get, parameters: parameters).responseJSON {response in
            print("вызов списка друзей")
//            print(response.result)
            print(response.data?.prettyJSON)
            
            guard let jsonData = response.data else { return }
            
            do {
                let friendsContainer = try JSONDecoder().decode(FriendsContainer.self, from: jsonData)
                
                let friends = friendsContainer.response.items
                
                completion(friends)
            } catch {
                print(error)
            }
        }
    }
    // MARK: - DAO
    func getFriends2(completion: @escaping([FriendDAO])->()) {
                    
        let method = "/friends.get"
        let parameters: [String: String] = [
            "user_id": userId,
            "order": "name",
            "count": "1000",
            "fields": "photo_200, photo_100, photo_50, domain, city",
            "access_token": accessToken,
            "v": version
        ]
            
        let url = baseUrl + method
        
        AF.request(url, method: .get, parameters: parameters).responseJSON {response in
            print("вызов списка друзей")
            print(response.data?.prettyJSON)
            
            guard let jsonData = response.data else { return }
            
            do {
                let itemsData = try JSON(jsonData)["response"]["items"].rawData()
                let friends = try JSONDecoder().decode([FriendDAO].self, from: itemsData)

                completion(friends)
            } catch {
                print(error)
            }
        }
    }
    // MARK: - DTO
    func getFriends3(completion: @escaping([FriendDTO])->()) {
                    
        let method = "/friends.get"
        let parameters: [String: String] = [
            "user_id": userId,
            "order": "name",
            "count": "1000",
            "fields": "photo_200, photo_100, photo_50, city, domain",
            "access_token": accessToken,
            "v": version
        ]
            
        let url = baseUrl + method
        
        AF.request(url, method: .get, parameters: parameters).responseJSON {response in
            print("вызов списка друзей")
            print(response.data?.prettyJSON)
            
            guard let jsonData = response.data else { return }
            
            do {
                let itemsData = try JSON(jsonData)["response"]["items"].rawData()
                let friends = try JSONDecoder().decode([FriendDTO].self, from: itemsData)
                completion(friends)
            } catch {
                print(error)
            }
        }
    }
    
   
}



