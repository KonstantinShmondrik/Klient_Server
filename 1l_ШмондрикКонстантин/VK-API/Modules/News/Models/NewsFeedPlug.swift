//
//  NewsFeedPlug.swift
//  VK_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 30.01.2022.
//

import Foundation

struct NewsFeed  {
    //    let canDoubtCategory, isArchived: Bool?
    //    let postID: Int
    //    let likes: PurpleLikes?
    //    let isFavorite: Bool?
    //    let views: Views?
    //    let canSetCategory: Bool?
    //    let sourceID: Int
    //    let type: String
    let date: String
    //    let shortTextRate: Double?
    //    let canEdit: Int?
    //    let canArchive: Bool?
    //    let attachments: [Attachment]?
    //    let postSource: PostSource?
    //    let postType: String?
    //    let reposts: FluffyReposts?
    let text: String?
    //    let comments: Comments?
    //    let donut: Donut?
    let canDelete: Int?
    //    let photos: Photos?
}






struct NewsFeedPlug {
    let newsText: String?
    let newsPhoto: String?
    let user: Users
    let dateOfPublication: String
//  let comments: Comment
//  let like: Like
}

struct Comment {
    let commensCount: Int
    
}

struct Like {
    let LikeCount: Int
    
}
