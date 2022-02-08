//
//  FriendsParsingOperations.swift
//  VK_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 08.02.2022.
//

import Foundation
import Alamofire
import SwiftyJSON
//MARK: парсинг данных (список друзей)

class FriendsParsingOperations: Operation {
    var friedsList: [Friend]? = []
    
    override func main() {
        guard let friendsListData = dependencies.first as? FriendsMakeAPIDataOperations,
              let data = friendsListData.data else {return}
        
        do {
            let responceData = try JSONDecoder().decode(FriendsContainer.self, from: data)
            self.friedsList = responceData.response.items
        } catch {
            print(error)
        }
    }
}
