//
//  DevicesWebDataSourceImpl.swift
//
//
//  Created by Артём Клыч on 19.04.2024.
//

import DevicesAPI
import Foundation
import HTTPClientAPI
import WebDataSourceAPI

struct DevicesWebDataSourceImpl: DevicesWebDataSource {
    private let httpClient: HTTPClient
    private let deviceCategoryMapper = DeviceCategoryMapper()
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func getDeviceCategories() async throws -> [DeviceCategory] {
        let route = DeviceAPIRouter.getAppleDevices
        
        guard let result: [DeviceEntity] = try? await httpClient.request(route) else {
            throw WebServiceError.requestError
        }
        
        guard let devices = deviceCategoryMapper.map(to: result) else {
            throw WebServiceError.mapError
        }
        
        return devices
    }
}
