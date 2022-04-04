//
//  FriendsMakeAPIDataOperations.swift
//  VK_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 08.02.2022.
//

import Foundation

// MARK: запрос списка друзей

class FriendsMakeAPIDataOperations: Operation {
    var data: Data?
    
    override func main() {
        var requestConstruktor = URLComponents()
        requestConstruktor.scheme = "https"
        requestConstruktor.host = "api.vk.com"
        requestConstruktor.path = "/method/friends.get"
        requestConstruktor.queryItems = [
            URLQueryItem(name: "user_id", value: "\(Session.shared.userId)"),
//            URLQueryItem(name: "order", value: "name"),
            URLQueryItem(name: "firstName", value: "first_name"),
            URLQueryItem(name: "lastName", value: "last_name"),
            URLQueryItem(name: "fields", value: "photo_200, photo_100, photo_50, domain, city"),
            URLQueryItem(name: "access_token", value: "\(Session.shared.token)"),
            URLQueryItem(name: "v", value: "\(Session.shared.version)")
        ]
        guard let url = requestConstruktor.url else {return}
        guard let data = try? Data(contentsOf: url) else {return}
        self.data = data

    }
}
