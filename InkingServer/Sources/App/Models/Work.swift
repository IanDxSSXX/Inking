//
//  Work.swift
//  
//
//  Created by 段奕含 on 2020/7/20.
//

import Fluent
import Vapor

final class Work: Model, Content {
    static let schema = "works"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: "content")
    var content: String
    
    @Timestamp(key: "createdAt", on: .update)
    var createdAt: Date?
    
    @Field(key: "workImage")
    var workImage: String
    
    @Parent(key: "card_id")
    var card: Card
    
    @Parent(key: "owner_id")
    var owner: User
    
    @Children(for: \.$work)
    var comments: [Comment]
    
    @Siblings(through: Like.self, from: \.$work, to: \.$user)
    public var likers: [User]
    
    
    init() {}
    
    init(id: UUID? = nil, content: String, createdAt: Date, workImage: String, card: Card) throws{
        self.id = id
        self.content = content
        self.createdAt = createdAt
        self.workImage = workImage
        self.$card.id = try card.requireID()
        
    }
}

