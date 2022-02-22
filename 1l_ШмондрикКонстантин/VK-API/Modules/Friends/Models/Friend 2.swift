//
//  Friend.swift
//  VK_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 18.12.2021.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let friendsContainer = try? newJSONDecoder().decode(FriendsContainer.self, from: jsonData)

import Foundation

// MARK: - FriendsContainer
struct FriendsContainer: Codable {
    let response: FriendsResponse
}

// MARK: - Response
struct FriendsResponse: Codable {
    let count: Int
    let items: [Friend]
}

// MARK: - Item
struct Friend: Codable {
    let canAccessClosed: Bool?
    let domain: String?
    let city: City?
    let id: Int
    let photo100: String?
    let lastName: String
    let photo50: String
    let trackCode: String?
    let isClosed: Bool?
    let firstName: String
    var photo50Url: String {
        return "\(photo50)"
    }

    enum CodingKeys: String, CodingKey {
        case canAccessClosed = "can_access_closed"
        case domain, city, id
        case photo100 = "photo_100"
        case lastName = "last_name"
        case photo50 = "photo_50"
        case trackCode = "track_code"
        case isClosed = "is_closed"
        case firstName = "first_name"
    }
}

// MARK: - City
struct City: Codable {
    let id: Int
    let title: String
}
