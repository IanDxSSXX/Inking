//
//  CreateLike.swift
//  
//
//  Created by 段奕含 on 2020/7/21.
//

import Fluent

struct CreateLike: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema(Like.schema)
            .id()
            .field("title", .string, .required)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema(Like.schema).delete()
    }
}

