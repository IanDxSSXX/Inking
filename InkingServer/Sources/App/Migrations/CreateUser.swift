//
//  File.swift
//  
//
//  Created by 段奕含 on 2020/7/21.
//
import Fluent

struct CreateUser: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema(User.schema)
            .id()
            .field("user_id", .string, .required)
            .unique(on: "user_id")
            .field("user_name", .string, .required)
            .field("password_hash", .string, .required)
            .field("level", .int, .required)
            .field("created_at", .datetime, .required)
            .field("signature", .string, .required)
            .field("avatar", .string, .required)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema(User.schema).delete()
    }
}
