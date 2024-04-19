//
//  FilmEntity.swift
//
//
//  Created by Артём Клыч on 18.04.2024.
//

import Foundation

public struct FilmEntity: Decodable {
    public let filmId: Int
    public let nameRu: String
    public let nameEn: String?
    public let year: String
    public let filmLength: String
    public let countries: [CountryEntity]
    public let genres: [GenreEntity]
    public let rating: String
    public let ratingVoteCount: Int
    public let posterUrl: String
    public let posterUrlPreview: String
    public let slogan: String?
    public let description: String
    public let shortDescription: String
}
