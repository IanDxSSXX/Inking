//
//  CreateComment.swift
//  
//
//  Created by 段奕含 on 2020/7/21.
//

import Fluent

struct CreateComment: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema(Comment.schema)
            .id()
            .field("createdAt", .datetime, .required)
            .field("content", .string, .required)
            .field("work_id", .uuid, .references("works", "id"))
            .field("commenter_id", .uuid, .references("users", "id"))
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema(Comment.schema).delete()
    }
}
