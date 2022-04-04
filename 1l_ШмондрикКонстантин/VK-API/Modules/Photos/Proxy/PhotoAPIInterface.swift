//
//  PhotoAPIInterface.swift
//  VK_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 04.04.2022.
//

import Foundation

protocol PhotoAPIInterface {
    
    func getPhotosAll2(userId: String, completion: @escaping([AllPhotos])->())
    
}





