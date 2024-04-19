//
//  SizePreferenceKey.swift
//
//
//  Created by Артём Клыч on 23.10.2023.
//

import Foundation
import SwiftUI

public struct SizePreferenceKey: PreferenceKey {
    public static var defaultValue: CGSize = .zero
    public static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}
