//
//  AppDetailColumn.swift
//
//
//  Created by Артём Клыч on 19.03.2024.
//

import Films
import SwiftUI
import NavigationAPI

public struct AppDetailColumn: View {
    
    // MARK: Constants
    
    private let filmDetailAnimation: Namespace.ID
    
    // MARK: Variables
    
    private var screen: AppScreen?
    
    // MARK: EnvironmentObject
    
    // MARK: Init
    
    public init(screen: AppScreen?, filmDetailAnimation: Namespace.ID) {
        self.screen = screen
        self.filmDetailAnimation = filmDetailAnimation
    }
    
    private var clearSelection: AppScreen {
        screen ?? .films
    }
    
    @ViewBuilder
    private var destination: some View {
        switch clearSelection {
        case .films:
            FilmsList(animation: filmDetailAnimation)
        case .devices:
            Text("sf")
        case .store:
            Text("sf")
        }
    }
    
    public var body: some View {
        Group {
            destination
        }
        #if os(macOS)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background()
        #endif
    }
}
