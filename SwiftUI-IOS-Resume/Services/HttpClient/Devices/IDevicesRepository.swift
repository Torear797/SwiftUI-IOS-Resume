//
//  IDevicesRepository.swift
//  IOS-Resume
//
//  Created by Torear797 on 29.01.2023.
//

import Combine

protocol IDevicesRepository {
    func getAppleDevices() -> AnyPublisher<[DeviceInfo], Error>
}
