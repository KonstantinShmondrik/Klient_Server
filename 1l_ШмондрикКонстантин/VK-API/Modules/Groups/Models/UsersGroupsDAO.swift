//
//  UsersGroupsDAO.swift
//  VK_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 24.12.2021.
//

import Foundation
import RealmSwift


// MARK: - UsersGroupsDAO
class UsersGroupsDAO: Object, Codable {
    @objc dynamic var id, isClosed, isAdvertiser: Int
    @objc dynamic var type: String?
    @objc dynamic var isMember: Int
    @objc dynamic var photo50, photo200: String
    @objc dynamic var activity: String?
    @objc dynamic var isAdmin: Int
    @objc dynamic var photo100: String
    @objc dynamic var name, screenName: String

    enum CodingKeys: String, CodingKey {
        case id
        case isClosed = "is_closed"
        case isAdvertiser = "is_advertiser"
        case type
        case isMember = "is_member"
        case photo50 = "photo_50"
        case photo200 = "photo_200"
        case activity
        case isAdmin = "is_admin"
        case photo100 = "photo_100"
        case name
        case screenName = "screen_name"
    }
}
