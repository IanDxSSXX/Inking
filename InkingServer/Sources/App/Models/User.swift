//
//  User.swift
//  
//
//  Created by 段奕含 on 2020/7/20.
//

import Fluent
import Vapor

final class User: Model, Content, Authenticatable{
    static let schema = "users"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: "user_id")
    var userID: String
    
    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?
    
    @Field(key: "user_name")
    var userName: String
    
    @Field(key: "password_hash")
    var passwordHash: String
    
    @Field(key: "level")
    var level: Int
    
    @Field(key: "avatar")
    var avatar: String
    
    @Field(key: "signature")
    var signature: String
    
    @Children(for: \.$owner)
    var works: [Work]
    
    @Siblings(through: Colloction.self, from: \.$user, to: \.$work)
    public var collections: [Work]
    
    
    init() { }

    init(id: UUID? = nil, userID: String, userName: String, passwordHash: String) {
        self.id = id
        self.userID = userID
        self.userName = userName
        self.passwordHash = passwordHash
        self.level = 0
        self.avatar = Default().avatar
        self.signature = Default().signature
        
        
    }
}


extension User {
    struct Create: Content, Validatable {
        var userID: String
        var userName: String
        var password: String
        var confirmPassword: String
        
        
        static func validations(_ validations: inout Validations) {
            validations.add("userID", as: String.self, is: .count(4...12))
            validations.add("userName", as: String.self, is: .count(2...8))
            validations.add("password", as: String.self, is: .count(8...))
        }
        
        
    }
}

extension User: ModelAuthenticatable {
    static let usernameKey = \User.$userID
    static let passwordHashKey = \User.$passwordHash
    
    func verify(password: String) throws -> Bool {
        try Bcrypt.verify(password, created: self.passwordHash)
    }
}

extension User {
    func generateToken() throws -> UserToken {
        try .init(
            value: [UInt8].random(count: 16).base64,
            userID: self.requireID()
        )
    }
}
