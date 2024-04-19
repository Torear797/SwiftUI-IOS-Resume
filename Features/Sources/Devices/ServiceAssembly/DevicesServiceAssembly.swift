//
//  DevicesServiceAssembly.swift
//
//
//  Created by Артём Клыч on 19.04.2024.
//

import DependencyInjection
import DevicesAPI
import Swinject
import WebDataSourceAPI

public final class DevicesServiceAssembly: Assembly {
    public init() {}
    
    public func assemble(container: Container) {
        registerDevicesRepository(container)
    }
    
    private func registerDevicesRepository(_ container: Container) {
        container.register(DevicesRepository.self) { r in
            let dataSource = r.resolve(DevicesWebDataSource.self)!
            return DevicesRepositoryImpl(dataSource: dataSource)
        }
    }
}
