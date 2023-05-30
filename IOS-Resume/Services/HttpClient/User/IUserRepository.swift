//
//  IUserRepository.swift
//  IOS-Resume
//
//  Created by Torear797 on 29.05.2023.
//

import Combine

protocol IUserRepository {
    func getUser() -> AnyPublisher<User, Error>
}
