//
//  Resolver.swift
//  IOS-Resume
//
//  Created by Torear797 on 10.05.2023.
//

import Foundation
import Swinject

final class Resolver {
    
    static let shared = Resolver()
    
    private var container = buildContainer()
    
    func resolve<T>(_ type: T.Type) -> T {
        container.resolve(T.self)!
    }
    
    static func buildContainer() -> Container {
        let container = Container()
        
        registerHttpClient(container)
        registerUserDefaultManager(container)
        
        return container
    }
    
    func setDependencyContainer(_ container: Container) {
        self.container = container
    }
    
    private static func registerHttpClient(_ container: Container) {
        registerNetworkCall(container)
        registerKinopoiskRepository(container)
        registerDevicesRepository(container)
        registerUserRepository(container)
    }
    
    private static func registerNetworkCall(_ container: Container) {
        container.register(INetworkCall.self) { r in
            return NetworkCall()
        }
        .inObjectScope(.container)
    }
    
    private static func registerDevicesRepository(_ container: Container) {
        container.register(IDevicesRepository.self) { r in
            let network = r.resolve(INetworkCall.self)!
            return DevicesRepository(network: network)
        }
        .inObjectScope(.container)
    }
    
    private static func registerKinopoiskRepository(_ container: Container) {
        container.register(IKinopoiskRepository.self) { r in
            let network = r.resolve(INetworkCall.self)!
            return KinopoiskRepository(network: network)
        }
        .inObjectScope(.container)
    }
    
    private static func registerUserRepository(_ container: Container) {
        container.register(IUserRepository.self) { r in
            let network = r.resolve(INetworkCall.self)!
            return UserRepository(network: network)
        }
        .inObjectScope(.container)
    }
    
    private static func registerUserDefaultManager(_ container: Container) {
        container.register(IUserDefaultManager.self) { _ in
            return UserDefaultManager()
        }
        .inObjectScope(.container)
    }
}
