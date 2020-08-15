//
//  Data.swift
//  Inking
//
//  Created by 段奕含 on 2020/7/20.
//

import Foundation
import UIKit

let font1  = "YRDZST-Semibold"
let W = UIScreen.main.bounds.width
let H = UIScreen.main.bounds.height
let iconSize = H*0.03
let deviceIdiom = UIScreen.main.traitCollection.userInterfaceIdiom




//MARK: -read from local JSON

let userData : [User] = load("UserData.json")
let cardData : [Card] = load("CardData.json")
let workData : [Work] = load("WorkData.json")
var commentData : [Comment] = load("CommentData.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

