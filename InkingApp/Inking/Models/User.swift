//
//  User.swift
//  Inking
//
//  Created by 段奕含 on 2020/7/20.
//

import Foundation

struct User: Hashable, Codable, Identifiable
{
    var id: UUID?
    var userID: String = ""
    var password: String = ""
    var username: String = ""
    var level: Int = 0
    var avatar: String = ""
    var signature: String = ""
}

struct UserData: Hashable, Codable, Identifiable
{
    var id: UUID?
    var userID: String = ""
    var password: String = ""
    var username: String = ""
    var level: Int = 0
    var avatar: String = ""
    var signature: String = ""
    var fanCount: Int
    var followCount: Int
    var collections: [Work]
}
