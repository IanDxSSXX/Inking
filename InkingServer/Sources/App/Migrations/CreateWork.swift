//
//  CreatWork.swift
//
//
//  Created by 段奕含 on 2020/7/21.
//

import Fluent

struct CreateWork: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema(Work.schema)
            .id()
            .field("createdAt", .date)
            .field("workImage", .string, .required)
            .field("content", .string, .required)
            .field("owner_id", .uuid, .references("users", "id"))
            .field("card_id", .uuid, .references("cards", "id"))
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema(Work.schema).delete()
    }
}

