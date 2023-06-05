//
//  ViewOffsetKey.swift
//  IOS-Resume
//
//  Created by Torear797 on 22.05.2023.
//

import SwiftUI

struct ViewOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value += nextValue()
    }
}
