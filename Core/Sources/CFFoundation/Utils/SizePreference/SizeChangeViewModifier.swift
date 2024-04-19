//
//  SizeChangeModifire.swift
//
//
//  Created by Артём Клыч on 23.10.2023.
//

import Foundation
import SwiftUI

struct SizeChangeViewModifier: ViewModifier {
    
    @Binding var screenSize: CGSize

    func body(content: Content) -> some View {
        content
            .overlay(
                GeometryReader { proxy in
                    Color.clear.preference(key: SizePreferenceKey.self, value: proxy.size)
                }
            )
            .onPreferenceChange(SizePreferenceKey.self) { value in
                screenSize = value
            }
    }
}

public extension View {
    func onSizeChange(screenSize: Binding<CGSize>) -> some View {
        modifier(SizeChangeViewModifier(screenSize: screenSize))
    }
}
