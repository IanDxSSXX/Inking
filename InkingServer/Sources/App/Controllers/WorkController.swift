//
//  File.swift
//  
//
//  Created by 段奕含 on 2020/7/20.
//

import Fluent
import Vapor

struct WorkController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        let works = routes.grouped("works")
        works.get(use: index)

        works.group(UserToken.authenticator()) { work in
            work.post(":cardID", use: create)
            work.group(":workID") { work in
                work.put("like", use: like)
                work.put("collect", use: collect)
                work.put("comment", use: comment)
            }
        }
        
        works.group(":workID") { work in
            work.delete("delete", use: delete)
            work.get("comments", use: comments)
            work.get("likers", use: likers)
            work.put("update", use: update)
            work.put("owner", use: owner)
 

        }
    }

    /// get    得到数据库所有的work，不用传参
    func index(req: Request) throws -> EventLoopFuture<[Work]> {
        return Work.query(on: req.db).all()
    }

    /// post   以Me的身份新建一个work，参数要传一个能解码成Work的json
    func create(req: Request) throws -> EventLoopFuture<Work> {
        let me: User = try req.auth.require(User.self)
        let work: Work = try req.content.decode(Work.self)
        _ = Card.find(req.parameters.get("cardID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .map{ card in
                card.$works.create(work, on: req.db)
            }
        _ = me.$works.create(work, on: req.db)
        return work.save(on: req.db).map { work }
    }

    /// delete    删除一个work，参数为卡片的ID
    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        return Work.find(req.parameters.get("workID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .transform(to: .ok)
    }
    
    /// put    更新一个work
    func update(req: Request) throws -> EventLoopFuture<Work> {
        let newWork: Work = try req.content.decode(Work.self)
        return Work.find(req.parameters.get("workID"), on: req.db)
            .map { work in
                work?.createdAt = newWork.createdAt
                work?.workImage = newWork.workImage
                work?.content = newWork.content
                return work!
            }
    }
    
    
    
    /// post     以me的身份添加comment
    func comment(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        let me: User = try req.auth.require(User.self)
        let comment: Comment = try req.content.decode(Comment.self)
        comment.$user.id = me.id!
        _ = Work.find(req.parameters.get("workID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .map { work in
                work.$comments.create(comment, on: req.db)
            }
        return comment.save(on: req.db).transform(to: .ok)
    }
    
    /// get    查找这个work所有的comments
    func comments(req: Request) throws -> EventLoopFuture<[Comment]> {
        return Work.find(req.parameters.get("workID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { work in
                work.$comments.get(on: req.db)
            }
    }
    
    
    /// post     以me的身份添加like
    func like(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        let me: User = try req.auth.require(User.self)
        return Work.find(req.parameters.get("workID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .map { work in
                work.$likers.attach(me, on: req.db)
            }
            .transform(to: .ok)
    }
    
    /// get    查找这个work所有的likers
    func likers(req: Request) throws -> EventLoopFuture<[User]> {
        return Work.find(req.parameters.get("workID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { work in
                work.$likers.get(on: req.db)
            }
    }
    
    
    /// post     以me的身份添加collection
    func collect(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        let me: User = try req.auth.require(User.self)
        return Work.find(req.parameters.get("workID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .map { work in
                me.$collections.attach(work, on: req.db)
            }
            .transform(to: .ok)
    }
    
    /// get    查找这个work的owner
    func owner(req: Request) throws -> EventLoopFuture<User> {
        return Work.find(req.parameters.get("workID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .map { work in
                work.owner
            }
    }
    
}

