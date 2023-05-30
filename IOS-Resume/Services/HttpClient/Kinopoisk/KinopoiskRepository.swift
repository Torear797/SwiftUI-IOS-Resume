//
//  KinopoiskRepository.swift
//  IOS-Resume
//
//  Created by Torear797 on 14.01.2023.
//

import Combine

final class KinopoiskRepository: IKinopoiskRepository {
    
    private let network: INetworkCall
    
    init(network: INetworkCall) {
        self.network = network
    }

    func getTop250() -> AnyPublisher<ResultTop250, Error> {
        let params = KinopoiskAPI.getTop250
        return network.request(params)
    }    
    
}
