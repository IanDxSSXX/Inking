//
//  File.swift
//  
//
//  Created by 段奕含 on 2020/7/20.
//

import Vapor
import Fluent

final class Colloction: Model, Content {
    static let schema = "collections"

    @ID(key: .id)
    var id: UUID?

    @Parent(key: "user_id")
    var user: User

    @Parent(key: "work_id")
    var work: Work

    init() {}

    init(id: UUID? = nil, user: User, work: Work) throws {
        self.id = id
        self.$user.id = try user.requireID()
        self.$work.id = try work.requireID()
    }
}
