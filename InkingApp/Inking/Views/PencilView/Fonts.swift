//
//  Fonts.swift
//  Inking
//
//  Created by Tony Feng on 2020/7/26.
//

import SwiftUI

enum Fonts: String, CaseIterable, Identifiable {
    case 宋体
    case 楷体
    case 黑体
    case 草书
    case 行书
    case 仿宋
    case 行草

    var id: String { self.rawValue }
}
