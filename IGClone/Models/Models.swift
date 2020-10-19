//
//  Models.swift
//  IGClone
//
//  Created by Prachi Modi on 10/19/20.
//  Copyright © 2020 Prachi Modi. All rights reserved.
//

import Foundation

enum Gender {
    case male, female, other                //user func
}

struct User {
    let username: String
    let bio: String
    let name: (first: String, last: String)
    let birthdate: Int
    let gender: Gender
    let counts: UserCount
    let joinedDate: Date
}


struct UserCount {
    let followers: Int
    let following: Int
    let posts: Int
    
}

public enum UserPostType {
    case photo, video
}

//user post
public struct UserPost {
    let postType: UserPostType
    let taggedUsers: [String]
    let identifier: String
    let thumbnailImage: URL
    let postURL: URL
    let captiom: String?
    let likeCount:[PostLikes]
    let comments: [PostComments]
    let createdDate: Date
}

struct PostComments {
    let identifier: String
    let username: String
    let text: String
    let createDate: Date
    let likes: [CommentLike]
}

struct PostLikes {
    let username: String
    let postIdentifier: String
}

struct CommentLike {
    let username: String
    let commentIdentifier: String
}
