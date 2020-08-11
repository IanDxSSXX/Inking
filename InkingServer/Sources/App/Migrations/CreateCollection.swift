//
//  CreateCollection.swift
//  
//
//  Created by 段奕含 on 2020/7/21.
//

import Fluent

struct CreateCollection: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema(Colloction.schema)
            .id()
            .field("content", .string, .required)
            .field("work_id", .uuid, .references("works", "id"))
            .field("user_id", .uuid, .references("users", "id"))
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema(Colloction.schema).delete()
    }
}
