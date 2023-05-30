//
//  Film.swift
//  IOS-Resume
//
//  Created by Torear797 on 14.01.2023.
//

import Foundation

struct Film: Codable, Equatable, Identifiable {
    static func == (lhs: Film, rhs: Film) -> Bool {
        lhs.filmId == rhs.filmId &&
        lhs.rating == rhs.rating &&
        lhs.ratingVoteCount == rhs.ratingVoteCount
    }
    
    let filmId: Int
    let nameRu: String
    let nameEn: String?
    let year: String
    let filmLength: String
    let countries: [Country]
    let genres: [Genre]
    let rating: String
    let ratingVoteCount: Int
    let posterUrl: String
    let posterUrlPreview: String
    let slogan: String?
    let description: String
    let shortDescription: String
    
    var id: Int {
        filmId
    }
    
    var preview: URL {
        URL(string: posterUrlPreview)!
    }
    
    var original: URL {
        URL(string: posterUrl)!
    }
    
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
}

struct Country: Codable, Equatable {
    let country: String
}

struct Genre: Codable, Equatable {
    let genre: String
}

struct ResultTop250: Codable, Equatable {
    let pagesCount: Int
    let films: [Film]
}
