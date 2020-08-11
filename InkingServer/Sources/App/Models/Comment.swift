//
//  Comment.swift
//  
//
//  Created by 段奕含 on 2020/7/20.
//

import Vapor
import Fluent

final class Comment: Model, Content {
    static let schema = "comments"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: "content")
    var content: String
    
    @Timestamp(key: "createdAt", on: .create)
    var createdAt: Date?
    
    @Parent(key: "work_id")
    var work: Work
    
    @Parent(key: "commenter_id")
    var user: User
    
    
    init() {}
    
    init(id: UUID? = nil, content: String, createdAt: Date, work: Work, user: User) throws {
        self.id = id
        self.content = content
        self.createdAt = createdAt
        self.$work.id = try work.requireID()
        self.$user.id = try user.requireID()
    }

}

