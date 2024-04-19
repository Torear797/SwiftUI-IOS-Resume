//
//  AppServiceAssembly.swift
//  SwiftUI-IOS-Resume
//
//  Created by Артём Клыч on 18.04.2024.
//

import DependencyInjection
import Devices
import HTTPClient
import HTTPClientAPI
import Films
import Swinject
import UserDefaultManager
import UserDefaultManagerAPI
import WebDataSource

final class AppServiceAssembly: Assembly {
    static let shared = AppServiceAssembly()
    
    private let serviceAssebly: [Assembly] = [
        WebDataSourceAssembly(),
        FilmsServiceAssembly(),
        DevicesServiceAssembly(),
    ]
    
    func assemble(container: Container = Container()) {
        registerHTTPClient(container)
        registerUserDefaultManager(container)
        
        for service in serviceAssebly {
            service.assemble(container: container)
        }
        
        Resolver.shared.setDependencyContainer(container)
    }
    
    private func registerUserDefaultManager(_ container: Container) {
        container.register(UserDefaultManager.self) { _ in
            UserDefaultManagerImpl()
        }
    }
    
    private func registerHTTPClient(_ container: Container) {
        container.register(HTTPClient.self) { _ in
            AlamofireHTTPClient()
        }
        .inObjectScope(.container)
    }
}
