//
//  CategoryDetailsView.swift
//  IOS-Resume
//
//  Created by Torear797 on 04.02.2023.
//

import SwiftUI

struct CategoryDetailsView: View {
    
    @ObservedObject var viewModel: CategoryDetailsViewModel

    var body: some View {
        mainView
            .navigationTitle(viewModel.title)
    }
    
    private var mainView: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 15) {
                ForEach(viewModel.devices) { device in
                    NavigationLink {
                        DeviceDetailsView(device: device)
                    } label: {
                        DeviceView(item: CatalogItem(
                            image: device.previewURL,
                            title: device.Generation,
                            description: device.year.description)
                        )
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 20)
        }
        .frame(maxHeight: .infinity)
    }
}
