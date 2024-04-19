//
//  UserRepositoryImpl.swift
//
//
//  Created by Артём Клыч on 19.04.2024.
//

import ProfileAPI
import WebDataSourceAPI

struct UserRepositoryImpl: UserRepository {
    let dataSource: UserWebDataSource
    
    func getUser() async throws -> User {
        try await dataSource.getUser()
    }
}
