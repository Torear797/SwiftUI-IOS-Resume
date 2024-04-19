//
//  AppTabView.swift
//
//
//  Created by Артём Клыч on 13.02.2024.
//

import Devices
import Films
import Store
import SwiftUI
import NavigationAPI

public struct AppTabView: View {
    
    // MARK: Constants
    
    private let filmDetailAnimation: Namespace.ID
    
    // MARK: Binding
    
    @Binding public var selection: AppScreen?
    
    // MARK: State
    
    @State private var tappedTwice = false
    
    // MARK: Computed Property
    
    private var tabViewSelection: Binding<AppScreen> { Binding(
        get: { selection ?? .films },
        set: {
            if $0 == selection, !tappedTwice {
                tappedTwice = true
            }
            selection = $0
        }
    )}
    
    private var clearSelection: AppScreen {
        selection ?? .films
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
    
    // MARK: Init
    
    public init(
        selection: Binding<AppScreen?>,
        filmDetailAnimation: Namespace.ID
    ) {
        _selection = selection
        self.filmDetailAnimation = filmDetailAnimation
    }
    
    // MARK: Content
    
    public var body: some View {
        ScrollViewReader { proxy in
            TabView(selection: tabViewSelection) {
                ForEach(AppScreen.allCases) { screen in
                    destination
                        .tag(screen as AppScreen?)
                        .tabItem { screen.label }
                }
            }
        }
    }
}
