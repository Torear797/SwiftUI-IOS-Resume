//
//  ScaleButtonStyle.swift
//  
//
//  Created by Артём Клыч on 16.08.2023.
//

import SwiftUI

public struct ScaleButtonStyle: ButtonStyle {
    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.9497 : 1)
            .animation(.spring(duration: 0.12), value: configuration.isPressed)
    }
    
    public init() {}
}

public extension ButtonStyle where Self == ScaleButtonStyle {
    static var scaleButtonStyle: Self { .init() }
}
