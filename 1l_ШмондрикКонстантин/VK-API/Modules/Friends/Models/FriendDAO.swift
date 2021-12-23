//
//  File.swift
//  VK_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 23.12.2021.
//

import Foundation
import RealmSwift



// MARK: - FriendDAO
class FriendDAO: Object, Codable {
//    @objc dynamic var canAccessClosed: String = ""
    @objc dynamic var domain: String = ""
//    @objc dynamic var city: CityDAO
    @objc dynamic var id: Int = 0
    @objc dynamic var photo100: String = ""
    @objc dynamic var lastName: String = ""
    @objc dynamic var photo50: String = ""
    @objc dynamic var trackCode: String = ""
//    @objc dynamic var isClosed: Bool
    @objc dynamic var firstName: String = ""

    enum CodingKeys: String, CodingKey {
//        case canAccessClosed = "can_access_closed"
        case domain, id //  city
        case photo100 = "photo_100"
        case lastName = "last_name"
        case photo50 = "photo_50"
        case trackCode = "track_code"
//        case isClosed = "is_closed"
        case firstName = "first_name"
    }
}

// MARK: - City
//class CityDAO: Object, Codable {
//    @objc dynamic var id: Int = 0
//    @objc dynamic var title: String = ""
//}
