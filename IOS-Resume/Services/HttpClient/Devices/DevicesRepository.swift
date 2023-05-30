//
//  DevicesRepository.swift
//  IOS-Resume
//
//  Created by Torear797 on 29.01.2023.
//

import Combine

final class DevicesRepository: IDevicesRepository {
    
    private let network: INetworkCall
    
    init(network: INetworkCall) {
        self.network = network
    }

    func getAppleDevices() -> AnyPublisher<[DeviceInfo], Error> {
        let params = DeviceAPI.getAppleDevices
        return network.request(params)
    }    
    
}
