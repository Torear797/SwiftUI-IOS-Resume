//
//  DevicesRepository.swift
//
//
//  Created by Артём Клыч on 19.04.2024.
//

import DevicesAPI
import WebDataSourceAPI

struct DevicesRepositoryImpl: DevicesRepository {
    let dataSource: DevicesWebDataSource
    
    func getDeviceCategories() async throws -> [DeviceCategory] {
        try await dataSource.getDeviceCategories()
    }
}
