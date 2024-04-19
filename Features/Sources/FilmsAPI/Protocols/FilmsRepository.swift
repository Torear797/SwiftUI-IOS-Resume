//
//  FilmsRepository.swift
//
//
//  Created by Артём Клыч on 18.04.2024.
//

import Foundation

public protocol FilmsRepository {
    func getTop250() async throws -> [Film]
}
