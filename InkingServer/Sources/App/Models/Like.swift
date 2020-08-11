//
//  Like.swift
//  
//
//  Created by 段奕含 on 2020/7/20.
//

import Vapor
import Fluent

final class Like: Model, Content {
    static let schema = "likes"
    
    @ID(key: .id)
    var id: UUID?
    
    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?
    
    @Parent(key: "user_id")
    var user: User

    @Parent(key: "work_id")
    var work: Work

    init() {}

    init(id: UUID? = nil, createdAt: Date,user: User, work: Work) throws {
        self.id = id
        self.createdAt = createdAt
        self.$user.id = try user.requireID()
        self.$work.id = try work.requireID()
    }
}

