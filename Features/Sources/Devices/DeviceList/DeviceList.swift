//
//  DeviceList.swift
//
//
//  Created by Артём Клыч on 19.04.2024.
//

import DesignSystem
import DevicesAPI
import SwiftUI

struct DeviceList: View {
    let category: DeviceCategory
    
    var body: some View {
        mainView
            .navigationTitle(category.name)
    }
    
    private var mainView: some View {
        List {
            Section {
                ForEach(category.devices) { device in
                    NavigationLink {
                        DeviceDetail(device: device)
                    } label: {
                        DeviceRow(device: device)
                    }
                }
            }
            .listSectionSeparator(.hidden)
        }
        .listStyle(.plain)
    }
}
