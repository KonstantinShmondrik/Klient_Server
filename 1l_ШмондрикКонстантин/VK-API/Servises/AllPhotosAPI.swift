//
//  AllPhotosAPI.swift
//  VK_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 19.12.2021.
//


//https://api.vk.com/method/METHOD?PARAMS&access_token=TOKEN&v=V

import Foundation
import Alamofire
import RealmSwift
import SwiftyJSON


final class AllPhotosAPI {
    
    let baseUrl = "https://api.vk.com/method"
    let accessToken = Session.shared.token
    let ownerId = "-" + Session.shared.userId // что это за параметр и как его использовать?
    let userId = Session.shared.userId
    let version = "5.131"
   
    // MARK: - DTO
    func getPhotosAll(completion: @escaping([AllPhotos])->()) {
                    
        let method = "/photos.getAll"
        let parameters: [String : String] = [
            "owner_id": userId,
            "count": "5",
//            "extended": "1",
//            "photo_sizes": "1",
//            "no_service_albums": "1",
            "access_token": accessToken,
            "v": version
        ]
            
        let url = baseUrl + method
        
        AF.request(url, method: .get, parameters: parameters).responseJSON {response in
            print("вызов всех фотографий пользователя")
            //            print(response.result)
            print(response.data?.prettyJSON)
            
            guard let jsonData = response.data else { return }
            
            do {
            let allPhotoContainer = try JSONDecoder().decode(AllPhotoContainer.self, from: jsonData)

                let photos = allPhotoContainer.response.items

                completion(photos)
            } catch {
                print(error)
            }
        }
    }
    
}
