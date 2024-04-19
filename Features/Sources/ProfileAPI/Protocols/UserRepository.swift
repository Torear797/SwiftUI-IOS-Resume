//
//  UserRepository.swift
//
//
//  Created by Артём Клыч on 19.04.2024.
//

import Foundation

public protocol UserRepository {
    func getUser() async throws -> User
}
