//
//  Film.swift
//
//
//  Created by Артём Клыч on 18.04.2024.
//

import CFFoundation
import Foundation

public struct Film: Equatable, Identifiable {
    public let id: Int
    public let nameRu: String
    public let nameEn: String?
    public let year: String
    public let filmLength: String
    public let countries: [Country]
    public let genres: [Genre]
    public let rating: String
    public let ratingVoteCount: Int
    public let poster: ImageSize
    public let slogan: String?
    public let description: String
    public let shortDescription: String
    
    var genresList: String {
        genres.compactMap({ $0.genre }).joined(separator: ", ")
    }
    
    var countriesList: String {
        countries.compactMap({ $0.country }).joined(separator: ", ")
    }
    
    var ratingNumber: Double {
        Double(rating) ?? 0.0
    }
    
    var ratingColor: String {
        if ratingNumber >= 7.0 { return "ratingGreen" }
        if ratingNumber < 5.0 { return "ratingRed" }
        
        return "ratingGray"
    }
    
    var ratingVoteString: String {
        "\(ratingVoteCount / 1000)K"
    }
    
    public var info: String {
        "\(nameEn ?? nameRu), \(year), \(filmLength)"
    }
    
    public init(
        id: Int,
        nameRu: String,
        nameEn: String?,
        year: String,
        filmLength: String,
        countries: [Country],
        genres: [Genre],
        rating: String,
        ratingVoteCount: Int,
        poster: ImageSize,
        slogan: String?,
        description: String,
        shortDescription: String
    ) {
        self.id = id
        self.nameRu = nameRu
        self.nameEn = nameEn
        self.year = year
        self.filmLength = filmLength
        self.countries = countries
        self.genres = genres
        self.rating = rating
        self.ratingVoteCount = ratingVoteCount
        self.poster = poster
        self.slogan = slogan
        self.description = description
        self.shortDescription = shortDescription
    }
}
