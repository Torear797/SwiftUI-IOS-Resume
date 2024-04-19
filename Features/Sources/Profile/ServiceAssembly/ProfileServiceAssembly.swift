//
//  ProfileServiceAssembly.swift
//
//
//  Created by Артём Клыч on 19.04.2024.
//

import DependencyInjection
import ProfileAPI
import Swinject
import WebDataSourceAPI

public final class ProfileServiceAssembly: Assembly {
    public init() {}
    
    public func assemble(container: Container) {
        registerUserRepository(container)
    }
    
    private func registerUserRepository(_ container: Container) {
        container.register(UserRepository.self) { r in
            let dataSource = r.resolve(UserWebDataSource.self)!
            return UserRepositoryImpl(dataSource: dataSource)
        }
    }
}
