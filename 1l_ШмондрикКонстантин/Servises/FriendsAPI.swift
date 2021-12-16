//
//  FriendsAPI.swift
//  VK_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 12.12.2021.
//

//https://api.vk.com/method/METHOD?PARAMS&access_token=TOKEN&v=V

import Foundation
import Alamofire

struct Friend {                     // Структура заглушка, потом создам отдельный файл с классом
    var name = ""
}



final class FriendsAPI {
    
    let baseUrl = "https://api.vk.com/method"
    let accessToken = Session.shared.token
    let userId = Session.shared.userId
    let version = "5.131"
   
    
    func getFriends(completion: @escaping([Friend])->()) {

        completion([Friend()])
                    
        let method = "/friends.get"
        let parameters: [String : String] = [
            "user_id": userId,
            "order": "name",
            "fields": "photo_50, photo_100, city, domain",
            "count": "5",
            "access_token": accessToken,
            "v": version
        ]
            
        let url = baseUrl + method
        
        AF.request(url, method: .get, parameters: parameters).responseJSON {response in
            print("вызов списка друзей")
            print(response.result)
        }
    }
}


