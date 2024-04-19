//
//  DevicesRepository.swift
//
//
//  Created by Артём Клыч on 19.04.2024.
//

import Foundation

public protocol DevicesRepository {
    func getDeviceCategories() async throws -> [DeviceCategory]
}
