//
//  AllPhotos.swift
//  VK_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 19.12.2021.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let allPhotoContainer = try? newJSONDecoder().decode(AllPhotoContainer.self, from: jsonData)

import Foundation

// MARK: - AllPhotoContainer
struct AllPhotoContainer: Codable {
    let response: AllPhotoResponse
}

// MARK: - Response
struct AllPhotoResponse: Codable {
    let count: Int
    let items: [AllPhotos]
}

// MARK: - Item
struct AllPhotos: Codable {
    let albumID, id, date: Int
    let text: String
    let sizes: [Size2]
    let hasTags: Bool
    let ownerID: Int
    let postID: Int?

    enum CodingKeys: String, CodingKey {
        case albumID = "album_id"
        case id, date, text, sizes
        case hasTags = "has_tags"
        case ownerID = "owner_id"
        case postID = "post_id"
    }
}

// MARK: - Size
struct Size2: Codable {
    let width, height: Int
    let url: String
    let type: String
}
