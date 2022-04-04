//
//  AllPhotosAPIProxy.swift
//  VK_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 04.04.2022.
//

import Foundation

class AllPhotosAPIProxy: PhotoAPIInterface {
    
    let allPhotosAPI: AllPhotosAPI
    init(allPhotosAPI: AllPhotosAPI) {
        self.allPhotosAPI = allPhotosAPI
    }
    
    func getPhotosAll2(userId: String, completion: @escaping ([AllPhotos]) -> ()) {
        self.allPhotosAPI.getPhotosAll2(userId: userId, completion: completion)
        print("called func getPhotosAll with userID=\(userId)")
    }
}
