//
//  FilmsResponseEntity.swift
//
//
//  Created by Артём Клыч on 18.04.2024.
//

import Foundation

public struct FilmsResponseEntity: Decodable {
    public let pagesCount: Int
    public let films: [FilmEntity]
}
