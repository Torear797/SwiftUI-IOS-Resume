//
//  AppDetailColumn.swift
//
//
//  Created by Артём Клыч on 19.03.2024.
//

import Devices
import Films
import Store
import SwiftUI
import NavigationAPI

public struct AppDetailColumn: View {
    
    // MARK: Constants
    
    private let filmDetailAnimation: Namespace.ID
    
    // MARK: Variables
    
    private var screen: AppScreen?
    
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
            DeviceCategoriesList()
        case .store:
            StoreView()
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
