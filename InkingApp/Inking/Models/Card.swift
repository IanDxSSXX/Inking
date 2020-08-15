//
//  Card.swift
//  Inking
//
//  Created by 段奕含 on 2020/7/20.
//

import Foundation

struct Card: Hashable, Codable, Identifiable
{
    var id: UUID?
    var envelopeType: Int
    var date: String
    var paperImage: String
    var content: String
    var author: String
    var details: String
    var isOpen: Bool
}

struct CardData: Hashable, Codable, Identifiable
{
    var id: UUID?
    var envelopeType: Int
    var date: String
    var paperImage: String
    var content: String
    var author: String
    var details: String
    var works: [Work]
    var isOpen: Bool
}

