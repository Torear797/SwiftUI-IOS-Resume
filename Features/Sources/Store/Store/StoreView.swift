//
//  StoreView.swift
//
//
//  Created by Артём Клыч on 19.04.2024.
//

import SwiftUI

public struct StoreView: View {
    
    // MARK: StateObject
    
    @StateObject private var viewModel = ViewModel()
    
    // MARK: Init
    
    public init() {}
    
    // MARK: View
    
    public var body: some View {
        NavigationView {
            mainView
                .navigationTitle(LocalizationManager.store)
                .searchable(text: $viewModel.searchText)
                .toolbar { bottomToolbarItem }
        }
        .navigationViewStyle(.stack)
    }
    
    private var bottomToolbarItem: some ToolbarContent {
        ToolbarItemGroup(placement: .bottomBar) {
            Picker("Device Type", selection: $viewModel.selectedTab) {
                ForEach(viewModel.categories) { category in
                    Text(category.name).tag(category.id)
                }
            }
            .pickerStyle(.segmented)
        }
    }
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    private var mainView: some View {
        ScrollView {
            LazyVGrid(columns: columns, alignment: .leading, spacing: 30) {
                ForEach(viewModel.displayedDevices) { device in
                    StoreItem(device: device)
                }
            }
            .padding()
        }
    }
}
