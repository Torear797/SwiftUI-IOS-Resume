//
//  FilmsWebDataSource.swift
//
//
//  Created by Артём Клыч on 18.04.2024.
//

import FilmsAPI

public protocol FilmsWebDataSource {
    func getTop250() async throws -> [Film]
}
