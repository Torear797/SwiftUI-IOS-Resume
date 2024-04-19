//
//  AppScreen.swift
//  
//
//  Created by Артём Клыч on 12.02.2024.
//

import SwiftUI

public enum AppScreen: Codable, Hashable, Identifiable, CaseIterable {
    case films
    case devices
    case store
    
    public var id: AppScreen { self }
}

public extension AppScreen {
    
    var title: String {
        switch self {
        case .films:
            LocalizationManager.films
        case .devices:
            LocalizationManager.devices
        case .store:
            LocalizationManager.store
        }
    }
    
    @ViewBuilder
    var label: some View {
        switch self {
        case .films:
            Label(self.title, systemImage: "play.rectangle")
        case .devices:
            Label(self.title, systemImage: "iphone")
        case .store:
            Label(self.title, systemImage: "cart")
        }
    }
}
