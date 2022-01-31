//
//  NewsFeedAPI.swift
//  VK_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 30.01.2022.
//
//https://api.vk.com/method/METHOD?PARAMS&access_token=TOKEN&v=V

import Foundation
import Alamofire
import RealmSwift
import SwiftyJSON


final class NewsFeedAPI {
    
    let baseUrl = "https://api.vk.com/method"
    let accessToken = Session.shared.token
    let userId = Session.shared.userId
    let version = "5.131"
    
    //    MARK: - DTO
    
    func getNewsFeed(completion: @escaping([NewsFeed])->()) {
        
        let method = "/newsfeed.get"
        let parameters: [String : String] = [
            "filters": "post, photo, photo_tag, wall_photo, friend, note, audio, video",
//          "return_banned": "0",
//          "start_time": ,
//          "end_time": ,
            "max_photos": "5",
            "source_ids": userId,
//          "from": "new_from",
//          "offset": "new_offset", // по умолчанию 0
//          "start_from": "next_from",
            "count": "5", // не более 100. По умолчанию 50
//          "fields": "fields",
//          "section": userId,
            "access_token": accessToken,
            "v": version
        ]
        
        let url = baseUrl + method
        
        AF.request(url, method: .get, parameters: parameters).responseJSON {response in
            
            print("вызов ленты новостей")
//            print( response.result)
            print(response.data?.prettyJSON)
            
//            guard let jsonData = response.data else { return }
//
//            do {
//                let newsFeedContainer = try? newJSONDecoder().decode(NewsFeedContainer.self, from: jsonData)
//
//                let news = NewsFeedContainer.response.items
//
//                completion(news)
//            } catch {
//                print(error)
//            }
        }
    }
    
    func getNewsFeed2(completion: @escaping([NewsFeed])->()) {
        
        let method = "/wall.get"
        let parameters: [String : String] = [
            "owner_id": userId,
            "count": "5", // не более 100
            //            "filters": "suggests, postponed, owner, others,all",
            "extended": "1",
            "access_token": accessToken,
            "v": version
        ]
        
        let url = baseUrl + method
        
        AF.request(url, method: .get, parameters: parameters).responseJSON {response in
            
            print("вызов СТЕНЫ")
            //            print( response.result)
            print(response.data?.prettyJSON)
            
//            guard let jsonData = response.data else { return }
//
//            do {
//                let usersGroupContainer = try JSONDecoder().decode(UsersGroupContainer.self, from: jsonData)
//
//                let groups = usersGroupContainer.response.items
//
//                completion(groups)
//            } catch {
//                print(error)
//            }
        }
    }
    
    
}
