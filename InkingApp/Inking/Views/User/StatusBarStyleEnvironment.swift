//
//  StatusBarStyleEnvironment.swift
//  Inking
//
//  Created by Tony Feng on 2020/7/21.
//

import SwiftUI

extension EnvironmentValues {
    
    var statusBarStyle: StatusBarStyle { self[StatusBarStyle.Key.self] }
}

class StatusBarStyle {
    
    var getter: () -> UIStatusBarStyle = { .default }
    var setter: (UIStatusBarStyle) -> Void = { _ in }

    var current: UIStatusBarStyle {
        get { self.getter() }
        set { self.setter(newValue) }
    }
}

extension StatusBarStyle {
    
    struct Key: EnvironmentKey {
        static let defaultValue: StatusBarStyle = StatusBarStyle()
    }
}

