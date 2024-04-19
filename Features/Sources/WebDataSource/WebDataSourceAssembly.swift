//
//  WebDataSourceAssembly.swift
//
//
//  Created by Артём Клыч on 21.02.2024.
//

import DependencyInjection
import HTTPClientAPI
import Swinject
import WebDataSourceAPI

public final class WebDataSourceAssembly: Assembly {
    public init() {}
    
    public func assemble(container: Container) {
        registerFilmsWebDataSource(container)
        registerDevicesWebDataSource(container)
        registerUserWebDataSource(container)
    }
    
    private func registerFilmsWebDataSource(_ container: Container) {
        container.register(FilmsWebDataSource.self) { r in
            let httpClient = r.resolve(HTTPClient.self)!
            return FilmsWebDataSourceImpl(httpClient: httpClient)
        }
    }
    
    private func registerDevicesWebDataSource(_ container: Container) {
        container.register(DevicesWebDataSource.self) { r in
            let httpClient = r.resolve(HTTPClient.self)!
            return DevicesWebDataSourceImpl(httpClient: httpClient)
        }
    }
    
    private func registerUserWebDataSource(_ container: Container) {
        container.register(UserWebDataSource.self) { r in
            let httpClient = r.resolve(HTTPClient.self)!
            return UserWebDataSourceImpl(httpClient: httpClient)
        }
    }
}
