//
//  AppTabView.swift
//
//
//  Created by Артём Клыч on 13.02.2024.
//

import Films
import SwiftUI
import NavigationAPI

public struct AppTabView: View {
    
    // MARK: Constants
    
    private let filmDetailAnimation: Namespace.ID
    
    // MARK: Binding
    
    @Binding public var selection: AppScreen?
    
    // MARK: State
    
    @State private var tappedTwice = false
    
    // MARK: EnvironmentObject
        
//    @EnvironmentObject var eventChainListViewModel: EventChainList.ViewModel
//    @EnvironmentObject var eventChainRouter: EventChainsRouter
//    
//    @EnvironmentObject var eventListViewModel: EventList.ViewModel
//    @EnvironmentObject var eventDiaryRouter: EventDiaryRouter
//    
//    @EnvironmentObject var profileViewModel: ProfileView.ViewModel
//    @EnvironmentObject var profileRouter: ProfileRouter
    
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
           Text("sf")
        case .store:
            Text("sf")
        }
    }
    
//    private var router: any Router {
//        switch clearSelection {
//        case .eventChains:
//            eventChainRouter
//        case .eventDiary:
//            eventDiaryRouter
//        case .more:
//            profileRouter
//        }
//    }
    
//    private var tabViewModel: any RootViewModel {
//        switch clearSelection {
//        case .eventChains:
//            eventChainListViewModel
//        case .eventDiary:
//            eventListViewModel
//        case .more:
//            profileViewModel
//        }
//    }
    
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
//                        .onChange(of: tappedTwice) { isTapped in
//                            guard isTapped else { return }
//                            guard selection == screen as AppScreen?
//                            else { return }
//                            
//                            if router.canPopToRoot {
//                                router.popToRoot()
//                            } else {
//                                withAnimation {
//                                    proxy.scrollTo(
//                                        tabViewModel.topViewID,
//                                        anchor: .top
//                                    )
//                                    tappedTwice = false
//                                }
//                            }
//                        }
                }
            }
        }
    }
}
