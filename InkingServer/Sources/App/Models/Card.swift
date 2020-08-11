//
//  Card.swift
//  
//
//  Created by 段奕含 on 2020/7/20.
//

import Fluent
import Vapor

final class Card: Model, Content {
    static let schema = "cards"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: "envelope_type")
    var  envelopeType: Int
    
    @Field(key: "date")
    var  date: String
    
    @Field(key: "paper_image")
    var  paperImage: String
    
    @Field(key: "content")
    var  content: String
    
    @Field(key: "author")
    var  author: String
    
    @Field(key: "details")
    var  details: String
    
    @Children(for: \.$card)
    var works: [Work]

    init() {}

    init(id: UUID? = nil, envelopeType: Int, date: String, paperImage: String, content: String, author: String, details: String) {
        self.id = id
        self.envelopeType = envelopeType
        self.date = date
        self.paperImage = paperImage
        self.content = content
        self.author = author
        self.details = details
    }
    
}
