//
//  GroupsSearchAPI.swift
//  VK_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 17.12.2021.
//

//https://api.vk.com/method/METHOD?PARAMS&access_token=TOKEN&v=V

import Foundation
import Alamofire

struct GroupsSearch {                     // Структура заглушка, потом создам отдельный файл с классом
    var q = "поиск группы"
}



final class GroupsSearchAPI {
    
    let baseUrl = "https://api.vk.com/method"
    let accessToken = Session.shared.token
    let userId = Session.shared.userId
    let version = "5.131"
//    var q = "поиск группы" // заглушка
   
    
    func groupsSearch(completion: @escaping([GroupsSearch])->()) {

        completion([GroupsSearch()])
                    
        let method = "/groups.search"
        let parameters: [String : String] = [
//            "user_id": userId,
            "q": "q",
            "type": "group",
            "sort": "0",
            "count": "50",
            "access_token": accessToken,
            "v": version
        ]
            
        let url = baseUrl + method
        
        AF.request(url, method: .get, parameters: parameters).responseJSON {response in
           
            print("получение групп по поисковому запросу")
//            print( response.result)
            print(response.data?.prettyJSON)
        }
    }
}

