//
//  StoreView.swift
//  IOS-Resume
//
//  Created by Torear797 on 15.01.2023.
//

import SwiftUI

struct StoreView: View {
    
    @StateObject private var viewModel = StoreViewModel()
    
    var body: some View {
        mainView
            .navigationTitle("Store")
            .searchable(text: $viewModel.searchText, prompt: "Search Prompt")
            .toolbar { bottomToolbarItem }
            .sheet(item: $viewModel.selectedDevice, onDismiss: {
                viewModel.selectedDevice = nil
            }) { device in
                DeviceDetailsView(device: device)
            }
    }
    
    private var bottomToolbarItem: some ToolbarContent {
        ToolbarItemGroup(placement: .bottomBar) {
            segmentedControll
        }
    }
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    private var mainView: some View {
        ScrollView {
            LazyVGrid(columns: columns, alignment: .leading, spacing: 30) {
                ForEach(viewModel.getItems()) { device in
                    Button {
                        viewModel.selectedDevice = device
                    } label: {
                        StoreItem(device: device)
                    }
                    .buttonStyle(StaticButtonStyle())
                }
            }
            .padding()
        }
    }
    
    private var segmentedControll: some View {
        Picker("Device Type", selection: $viewModel.selectedTab) {
            ForEach(viewModel.categories) { category in
                Text(category.name).tag(category.id)
            }
        }
        .pickerStyle(.segmented)
    }
}

#if DEBUG
struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        StoreView()
    }
}
#endif
