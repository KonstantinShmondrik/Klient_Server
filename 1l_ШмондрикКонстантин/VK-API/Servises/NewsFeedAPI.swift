//
//  NewsFeedAPI.swift
//  VK_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 30.01.2022.
//
//https://api.vk.com/method/METHOD?PARAMS&access_token=TOKEN&v=V

import Foundation
import Alamofire
import SwiftyJSON
import SwiftUI


final class NewsFeedAPI {
    
    let baseUrl = "https://api.vk.com/method"
    let accessToken = Session.shared.token
    let userId = Session.shared.userId
    let version = "5.131"
    
    //    MARK: - DTO
    
    func getNewsFeed(completion: @escaping(NewsFeed?)->()) {
        
        let method = "/newsfeed.get"
        let parameters: [String : String] = [
            "filters": "post, photo, photo_tag, wall_photo, friend, note, audio, video",
            //          "return_banned": "0",
            //          "start_time": ,
            //          "end_time": ,
            "max_photos": "5",
            //            "source_ids": userId,
            //          "from": "new_from",
            //          "offset": "new_offset", // по умолчанию 0
            //          "start_from": "next_from",
//            "count": "5", // не более 100. По умолчанию 50
            //          "fields": "fields",
//            "section": userId,
            "access_token": accessToken,
            "v": version
        ]
        
        let url = baseUrl + method
        
        AF.request(url, method: .get, parameters: parameters).responseJSON {response in
            
            print("вызов ленты новостей")
            //            print( response.result)
            print(response.data?.prettyJSON as Any)
            
            guard let jsonData = response.data else { return }
            let decoder = JSONDecoder()
            let json = JSON(jsonData)
            let dispatchGroupe = DispatchGroup()
            
            let vkItemsJSONArr = json["response"]["items"].arrayValue
            let vkProfilesJSONArr = json["response"]["profiles"].arrayValue
            let vkGroupsJSONArr = json["response"]["groups"].arrayValue
            
            var vkItemsArr: [Item] = []
            var vkGroupsArr: [Group] = []
            var vkProfilesArr: [Profile] = []
            
            // MARK: - Decoding Items
            DispatchQueue.global().async(group: dispatchGroupe){
                for (index, items) in vkItemsJSONArr.enumerated(){
                    do {
                        let decodedItem = try decoder.decode(Item.self, from: items.rawData())
                        vkItemsArr.append(decodedItem)
                    } catch {
                        print("Item decoder error at index \(index), err: \(error)")
                    }
                }
            }
            
            // MARK: - Decoding Profiles
            DispatchQueue.global().async(group: dispatchGroupe){
                for (index, profiles) in vkProfilesJSONArr.enumerated(){
                    do {
                        let decodedItem = try decoder.decode(Profile.self, from: profiles.rawData())
                        vkProfilesArr.append(decodedItem)
                    } catch {
                        print("Profile decoder error at index \(index), err: \(error)")
                    }
                }
            }
            
            // MARK: - Decoding Groups
            DispatchQueue.global().async(group: dispatchGroupe){
                for (index, groups) in vkGroupsJSONArr.enumerated(){
                    do {
                        let decodedItem = try decoder.decode(Group.self, from: groups.rawData())
                        vkGroupsArr.append(decodedItem)
                    } catch {
                        print("Group decoder error at index \(index), err: \(error)")
                    }
                }
            }
            
            dispatchGroupe.notify(queue: DispatchQueue.main) {
                let response = FeedResponse(items: vkItemsArr,
                                            groups: vkGroupsArr,
                                            profiles: vkProfilesArr
                )
                let newsFeed = NewsFeed(response: response) // поставить скобки квадратные??
                
                completion(newsFeed)
            }
        }
    }
    
}


