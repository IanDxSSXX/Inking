//
//  CardController.swift
//  
//
//  Created by 段奕含 on 2020/7/20.
//

import Fluent
import Vapor

struct CardController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        let cards = routes.grouped("cards")
        cards.get(use: index)
        cards.post(use: create)
        cards.group(":cardID") { card in
            card.delete("delete", use: delete)
            card.get("works", use: works)
        }
    }

    /// get    得到数据库所有的card，不用传参
    func index(req: Request) throws -> EventLoopFuture<[Card]> {
        return Card.query(on: req.db).all()
    }

    /// post    新建一个card，参数要传一个能解码成Card的json
    func create(req: Request) throws -> EventLoopFuture<Card> {
        let card = try req.content.decode(Card.self)
        return card.save(on: req.db).map { card }
    }

    /// delete    删除一个card，参数为卡片的ID
    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        return Card.find(req.parameters.get("cardID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .transform(to: .ok)
    }
    
    
    /// get    查找这个Card所有的work
    func works(req: Request) throws -> EventLoopFuture<[Work]> {
        return Card.find(req.parameters.get("cardID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .map { card in
                card.works
            }
    }
    
}
