//
//  CategoryDetailsViewModel.swift
//  IOS-Resume
//
//  Created by Torear797 on 04.02.2023.
//

import Foundation

final class CategoryDetailsViewModel: ObservableObject {
    
    @Published var devices: [DeviceInfo]
    
    let title: String
    
    init(devices: [DeviceInfo], title: String) {
        self.devices = devices
        self.title = title
    }
}
