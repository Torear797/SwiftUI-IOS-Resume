//
//  FilmsRepository.swift
//
//
//  Created by Артём Клыч on 18.04.2024.
//

import FilmsAPI
import WebDataSourceAPI

struct FilmsRepositoryImpl: FilmsRepository {
    let dataSource: FilmsWebDataSource
    
    func getTop250() async throws -> [Film] {
        try await dataSource.getTop250()
    }
}
