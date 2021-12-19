//
//  PhotosAPI.swift
//  VK_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 16.12.2021.
//
//https://api.vk.com/method/METHOD?PARAMS&access_token=TOKEN&v=V

import Foundation
import Alamofire

//struct Photos {                     // Структура заглушка, потом создам отдельный файл с классом
//    var photo = ""
//}

final class PhotosAPI {
    
    let baseUrl = "https://api.vk.com/method"
    let accessToken = Session.shared.token
    let ownerId = "-" + Session.shared.userId // что это за параметр и как его использовать?
    let userId = Session.shared.userId
    let albumIdWall = "wall"            //albumId можно сделать входным параметром функцию, но как?
    let albumIdProfile = "profile"
    let albumIdSaved = "saved"
    let version = "5.131"
   
    
    func getPhotos(album_id: String, completion: @escaping([Photos])->()) {

//        completion([Photos()])
                    
        let method = "/photos.get"
        let parameters: [String : String] = [
            "owner_id": userId,
            "album_id": album_id,
//            "photo_ids": "photo",
            "rev": "0",
            "count": "5",
            "extended": "likes, comments, tags, can_comment, reposts",
            "access_token": accessToken,
            "v": version
        ]
            
        let url = baseUrl + method
        
        AF.request(url, method: .get, parameters: parameters).responseJSON {response in
            print("вызов фотографий пользователя")
            //            print(response.result)
            print(response.data?.prettyJSON)
            
            guard let jsonData = response.data else { return }
            
            do {
                let photoContainer = try JSONDecoder().decode(PhotoContainer.self, from: jsonData)
                let photos = photoContainer.response.items
                
                completion(photos)
            } catch {
                print(error)
            }
        }
    }
}


