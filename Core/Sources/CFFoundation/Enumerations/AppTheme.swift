//
//  AppTheme.swift
//
//
//  Created by Артём Клыч on 12.03.2024.
//

import SwiftUI

public enum AppTheme: String, CaseIterable, Identifiable {
    case light, dark, system
    
    public var id: Self { self }
    
    public var colorScheme: ColorScheme? {
        switch self {
        case .light:
                .light
        case .dark:
                .dark
        case .system:
            nil
        }
    }
}
