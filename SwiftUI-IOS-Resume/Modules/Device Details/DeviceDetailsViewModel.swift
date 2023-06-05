//
//  DeviceDetailsViewModel.swift
//  IOS-Resume
//
//  Created by Torear797 on 25.05.2023.
//

import Foundation

final class DeviceDetailsViewModel: ObservableObject {
    
    let paralaxHeaderHeight: CGFloat = 300
    let device: DeviceInfo
    
    let loremIpsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    
    init(device: DeviceInfo) {
        self.device = device
    }
    
    var description: String {
        device.description ?? loremIpsum
    }
    
    func isHiddenNavBar(offset: CGFloat) -> Bool {
        offset < (paralaxHeaderHeight - 50)
    }
    
}
