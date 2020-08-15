//
//  Work.swift
//  Inking
//
//  Created by 段奕含 on 2020/7/20.
//

import Foundation

struct Work: Hashable, Codable, Identifiable
{
    var id : UUID?
    var content: String
    var workImg: String
    var createdAt: String
    var likes : Int
}

