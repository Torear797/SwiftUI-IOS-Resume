//
//  View+Extension.swift
//  IOS-Resume
//
//  Created by Torear797 on 13.09.2022.
//

import SwiftUI

extension View {
    
    func gradientForeground(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
    
    func gradientForeground(
        colors: [Color],
        startPoint: UnitPoint = .top,
        endPoint: UnitPoint = .bottom
    ) -> some View {
        self.overlay(
            LinearGradient(
                colors: colors,
                startPoint: startPoint,
                endPoint: endPoint
            )
        )
        .mask(self)
    }
    
    // MARK: - ScrollView offset
    
    func offset(offset: Binding<CGFloat>) -> some View {
        self.overlay {
            GeometryReader { proxy in
                let minY = proxy.frame(in: .named("scroll")).minY
                
                Color.clear.preference(key: OffsetKey.self, value: minY)
            }
            .onPreferenceChange(OffsetKey.self) { value in
                offset.wrappedValue = value
            }
        }
    }
}

// MARK: - Offset key

struct OffsetKey: PreferenceKey {
  
    static var defaultValue = 0.0
    
    static func reduce(value: inout Double, nextValue: () -> Double) {
        value = nextValue()
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

