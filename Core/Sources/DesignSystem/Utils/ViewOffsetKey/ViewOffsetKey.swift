//
//  ViewOffsetKey.swift
//
//
//  Created by Артём Клыч on 09.03.2023.
//

import SwiftUI

public struct ViewOffsetKey: PreferenceKey {
    public typealias Value = CGFloat
    public static var defaultValue = CGFloat.zero
    public static func reduce(value: inout Value, nextValue: () -> Value) {
        value += nextValue()
    }
}
