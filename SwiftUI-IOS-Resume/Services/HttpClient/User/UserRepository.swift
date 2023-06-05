//
//  UserRepository.swift
//  IOS-Resume
//
//  Created by Torear797 on 29.05.2023.
//

import Combine

final class UserRepository: IUserRepository {
    
    private let network: INetworkCall
    
    init(network: INetworkCall) {
        self.network = network
    }
    
    func getUser() -> AnyPublisher<User, Error> {
        let params = UserAPI.getUser
        return network.request(params)
    }
}
