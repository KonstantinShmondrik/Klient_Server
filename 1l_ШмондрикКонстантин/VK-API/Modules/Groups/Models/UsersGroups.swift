//
//  Group.swift
//  VK_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 19.12.2021.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let usersGroupContainer = try? newJSONDecoder().decode(UsersGroupContainer.self, from: jsonData)

import Foundation

// MARK: - UsersGroupContainer
struct UsersGroupContainer: Codable {
    let response: UsersGroupsResponse
}

// MARK: - Response
struct UsersGroupsResponse: Codable {
    let count: Int
    let items: [UsersGroups]
}

// MARK: - Item
struct UsersGroups: Codable {
    let id, isClosed, isAdvertiser: Int
    let type: String?
    let isMember: Int
    let photo50, photo200: String
    let activity: String?
    let isAdmin: Int
    let photo100: String
    let name, screenName: String

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
