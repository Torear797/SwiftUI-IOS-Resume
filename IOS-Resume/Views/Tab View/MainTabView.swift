//
//  MainTabView.swift
//  IOS-Resume
//
//  Created by Torear797 on 15.01.2023.
//

import SwiftUI

struct MainTabView: View {
    
    @Namespace private var animation
    
    @State private var tabSelection = 1
    @State private var tappedTwice = false
    
    @StateObject private var filmDetailsViewModel = FilmDetailsViewModel()
    @StateObject private var viewModel = MainViewModel()
    
    var body: some View {
        mainView
            .overlay {
                if filmDetailsViewModel.canOpen {
                    FilmDetails(animation: animation)
                        .environmentObject(filmDetailsViewModel)
                }
            }
            .sheet(isPresented: $viewModel.isShowProfile) {
                ProfileView()
            }
    }
    
    private var mainView: some View {
        var handler: Binding<Int> { Binding(
            get: { self.tabSelection },
            set: {
                if $0 == self.tabSelection {
                    tappedTwice = true
                }
                self.tabSelection = $0
            }
        )}
        
        return ScrollViewReader { proxy in
            TabView(selection: handler) {
                getMoviesView(tabId: 1, proxy: proxy)
                getCatalogView(tabId: 2, proxy: proxy)
                getStoreView(tabId: 3, proxy: proxy)
            }
        }
    }
    
    private func getMoviesView(
        tabId: Int,
        proxy: ScrollViewProxy
    ) -> some View {
        MoviesView(animation: animation)
            .environmentObject(filmDetailsViewModel)
            .onChange(of: tappedTwice, perform: { tapped in
                tappedTwice(tabId, isTapped: tapped, proxy: proxy)
            })
            .tabItem { Label("Movies", systemImage: "play.rectangle") }
            .tag(tabId)
    }
    
    private func getCatalogView(
        tabId: Int,
        proxy: ScrollViewProxy
    ) -> some View {
        NavigationView {
            CatalogView()
                .onChange(of: tappedTwice, perform: { tapped in
                    tappedTwice(tabId, isTapped: tapped, proxy: proxy)
                })
                .toolbar {
                    avatarToolBarItem
                }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .tabItem { Label("Catalog", systemImage: "iphone") }
        .tag(tabId)
    }
    
    private func getStoreView(
        tabId: Int,
        proxy: ScrollViewProxy
    ) -> some View {
        NavigationView {
            StoreView()
                .onChange(of: tappedTwice, perform: { tapped in
                    tappedTwice(tabId, isTapped: tapped, proxy: proxy)
                })
                .toolbar {
                    avatarToolBarItem
                }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .tabItem { Label("Store", systemImage: "cart") }
        .tag(tabId)
    }
    
    private func tappedTwice(
        _ id: Int,
        isTapped: Bool,
        proxy: ScrollViewProxy
    ) {
        if tabSelection == id, isTapped {
            withAnimation {
                proxy.scrollTo(id)
            }
            tappedTwice = false
        }
    }
    
    private var avatarToolBarItem: some ToolbarContent {
        ToolbarItemGroup(placement: .navigationBarTrailing) {
            Button {
                viewModel.isShowProfile = true
            } label: {
                if let url = viewModel.user?.avatarURL {
                    KingfisherImage(url: url, contentMode: .fit)
                        .frame(width: 30, height: 30)
                        .clipShape(Circle())
                } else {
                    Circle()
                        .fill(.cyan)
                        .frame(width: 30, height: 30)
                }
            }
        }
    }
}
