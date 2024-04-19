//
//  FilmsServiceAssembly.swift
//
//
//  Created by Артём Клыч on 18.04.2024.
//

import DependencyInjection
import FilmsAPI
import Swinject
import WebDataSourceAPI

public final class FilmsServiceAssembly: Assembly {
    public init() {}
    
    public func assemble(container: Container) {
        registerFilmsRepository(container)
        registerFilmViewer(container)
    }
    
    private func registerFilmsRepository(_ container: Container) {
        container.register(FilmsRepository.self) { r in
            let dataSource = r.resolve(FilmsWebDataSource.self)!
            return FilmsRepositoryImpl(dataSource: dataSource)
        }
    }
    
    private func registerFilmViewer(_ container: Container) {
        container.register(FilmViewer.self) { _ in
            FilmViewerImpl()
        }
        .inObjectScope(.container)
    }
}
