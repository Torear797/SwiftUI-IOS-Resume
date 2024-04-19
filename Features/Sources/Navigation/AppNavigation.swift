//
//  AppNavigation.swift
//
//
//  Created by Артём Клыч on 19.03.2024.
//

import DependencyInjection
import NavigationAPI
import Films
import FilmsAPI
import SwiftUI

public struct AppNavigation: View {
    
    // MARK: State
    
    @State private var selection: AppScreen? = .films
    @State private var presentFilm: Film? = nil
    @State private var isCompleteFilmAnimation = true
    
    // MARK: DI

    @Inject private var filmViewer: FilmViewer
    
    @Namespace public var filmDetailAnimation
    
    // MARK: Init
    
    public init() {}

    public var body: some View {
        Group {
            if UIDevice.current.userInterfaceIdiom == .phone {
                AppTabView(
                    selection: $selection,
                    filmDetailAnimation: filmDetailAnimation
                )
            } else {
                if #available(iOS 16.0, *) {
                    NavigationSplitView {
                        AppSidebarList(selection: $selection)
                    } detail: {
                        AppDetailColumn(
                            screen: selection,
                            filmDetailAnimation: filmDetailAnimation
                        )
                    }
                } else {
                    AppTabView(
                        selection: $selection,
                        filmDetailAnimation: filmDetailAnimation
                    )
                }
            }
        }
        .onReceive(filmViewer.filmPublisher) { film in
            let isPresent = film != nil
            guard isCompleteFilmAnimation || !isPresent else { return }
            
            if isPresent {
                isCompleteFilmAnimation = false
            }
            
            withAnimation(.interactiveSpring(
                response: 0.6,
                dampingFraction: 0.7,
                blendDuration: 0.7
            )) {
                presentFilm = film
            }
        }
        .overlay {
            if let presentFilm {
                FilmDetailView(film: presentFilm, animation: filmDetailAnimation)
                    .onDisappear() {
                        isCompleteFilmAnimation = true
                    }
            }
        }
    }
}

#Preview {
    AppNavigation()
}
