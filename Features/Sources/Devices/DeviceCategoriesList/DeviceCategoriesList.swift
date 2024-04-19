//
//  DeviceCategoriesList.swift
//
//
//  Created by Артём Клыч on 19.04.2024.
//

import DesignSystem
import SwiftUI

public struct DeviceCategoriesList: View {
    
    // MARK: StateObject
    
    @StateObject private var viewModel = ViewModel()
    
    // MARK: Init
    
    public init() {}
    
    // MARK: View
    
    public var body: some View {
        NavigationView {
            mainView
                .navigationTitle(LocalizationManager.categories)
        }
        .navigationViewStyle(.stack)
    }
    
    private var mainView: some View {
        List {
            Section {
                ForEach(viewModel.categories) { category in
                    NavigationLink {
                        DeviceList(category: category)
                    } label: {
                        DeviceCategoryRow(category: category)
                    }
                }
            }
            .listSectionSeparator(.hidden)
        }
        .listStyle(.plain)
    }
}
