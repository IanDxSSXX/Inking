//
//  Comment.swift
//  Inking
//
//  Created by Tony Feng on 2020/7/20.
//

import SwiftUI

struct Comment: Hashable, Codable, Identifiable{
    var id : UUID?
    var commenterID: UUID?
    var commContent: String
//    var workID: UUID?
    var createdAt: String
}

struct Comments: Hashable, Codable, Identifiable{
    var id : UUID?
    var commentsdata : [Comment]
}

