//
//  CreatCard.swift
//  
//
//  Created by 段奕含 on 2020/7/21.
//

import Fluent

struct CreateCard: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema(Card.schema)
            .id()
            .field("envelopeType", .int, .required)
            .field("date", .string, .required)
            .field("paperImage", .string, .required)
            .field("content", .string, .required)
            .field("author", .string, .required)
            .field("details", .string, .required)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema(Card.schema).delete()
    }
}

