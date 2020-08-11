//
//  UserController.swift
//  
//
//  Created by 段奕含 on 2020/7/21.
//

import Fluent
import Vapor

struct UserController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        let users = routes.grouped("users")
        users.get(use: index)
        users.post(use: create)
        users.group(":userID") { user in
            user.delete("delete", use: delete)
            user.get("works", use: works)
            user.get("collections", use: collections)
            user.put("update", use: update)
        }
        users.group(User.authenticator()) { user in
            user.post("login", use: login)
        }
        users.group(UserToken.authenticator()) { user in
            user.get("me", use: me)
        }


    }

    /// get    得到数据库所有的user，不用传参
    func index(req: Request) throws -> EventLoopFuture<[User]> {
        return User.query(on: req.db).all()
    }

    /// post    新建一个user，参数要传一个能解码成User.content的json
    func create(req: Request) throws -> EventLoopFuture<User> {
        try User.Create.validate(content: req)
            let create = try req.content.decode(User.Create.self)
            guard create.password == create.confirmPassword else {
                throw Abort(.badRequest, reason: "Passwords did not match")
            }
        let user = try User(userID: create.userID,
                            userName: create.userName,
                            passwordHash: Bcrypt.hash(create.password))
        return user.save(on: req.db).map { user }
        
    }
    
    /// post    登陆user
    func login(req: Request) throws -> EventLoopFuture<UserToken> {
        let user = try req.auth.require(User.self)
        let token = try user.generateToken()
        return token.save(on: req.db).map { token }
    }
    
    /// get     输入token，得到授权
    func me(req: Request) throws -> User {
        try req.auth.require(User.self)
    }
    
    /// delete    删除一个user，参数为卡片的ID
    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        return User.find(req.parameters.get("userID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .transform(to: .ok)
    }
    
    /// put    更新一个user
    func update(req: Request) throws -> EventLoopFuture<User> {
        let newUser = try req.content.decode(User.self)
        return User.find(req.parameters.get("userID"), on: req.db)
            .map { user in
                user?.signature = newUser.signature
                user?.avatar = newUser.avatar
                user?.level = newUser.level
                user?.userName = newUser.userName
                return user!
            }
    }
    
    /// get    查找这个user所有的works
    func works(req: Request) throws -> EventLoopFuture<[Work]> {
        return User.find(req.parameters.get("userID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .map { user in
                user.works
            }
    }
    
    /// get    查找这个user所有的collections
    func collections(req: Request) throws -> EventLoopFuture<[Work]> {
        return User.find(req.parameters.get("userID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .map { user in
                user.collections
            }
    }
    

    
}
