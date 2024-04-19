//
//  FilmMapper.swift
//
//
//  Created by Артём Клыч on 18.04.2024.
//

import CFFoundation
import Foundation
import FilmsAPI
import WebDataSourceAPI

final class FilmMapper: Mapper {
    typealias InputType = FilmEntity
    typealias OutputType = Film
    
    func map(to inputData: FilmEntity) -> Film? {
        guard let previewURL = URL(string: inputData.posterUrlPreview)
        else { return nil }
        guard let originalURL = URL(string: inputData.posterUrl)
        else { return nil }
        
        let poster = ImageSize(preview: previewURL, original: originalURL)
        let countries = inputData.countries.map { Country(country: $0.country) }
        let genres = inputData.genres.map { Genre(genre: $0.genre) }
        
        return Film(
            id: inputData.filmId,
            nameRu: inputData.nameRu,
            nameEn: inputData.nameEn,
            year: inputData.year,
            filmLength: inputData.filmLength,
            countries: countries,
            genres: genres,
            rating: inputData.rating,
            ratingVoteCount: inputData.ratingVoteCount,
            poster: poster,
            slogan: inputData.slogan,
            description: inputData.description,
            shortDescription: inputData.shortDescription
        )
    }
}
