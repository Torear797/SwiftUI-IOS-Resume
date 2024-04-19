//
//  DevicesWebDataSource.swift
//
//
//  Created by Артём Клыч on 19.04.2024.
//

import DevicesAPI

public protocol DevicesWebDataSource {
    func getDeviceCategories() async throws -> [DeviceCategory]
}
