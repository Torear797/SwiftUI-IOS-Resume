//
//  FilmDetailsViewModel.swift
//  IOS-Resume
//
//  Created by Torear797 on 21.01.2023.
//

import Foundation

final class FilmDetailsViewModel: ObservableObject {
    
    @Published var selectedFilm: Film?
    @Published var isShow = false
    @Published var isAnimate = false
    @Published var isAnimateContent = false
    
    var nameRu: String {
        selectedFilm?.nameRu ?? "--"
    }
    
    var nameEn: String? {
        selectedFilm?.nameEn
    }
    
    var rating: String {
        selectedFilm?.rating ?? "--"
    }
    
    var ratingVote: String {
        selectedFilm?.ratingVoteString ?? "--"
    }
    
    var posterURL: URL {
        selectedFilm?.original ?? URL(string: "")!
    }
    
    var canOpen: Bool {
        isShow && selectedFilm != nil
    }
    
    var otherInfo: String {
        let year = selectedFilm?.year ?? ""
        let genres = selectedFilm?.genresList ?? ""
        let country = selectedFilm?.countriesList ?? ""
        let length = selectedFilm?.filmLength ?? ""
        
        return "\(year), \(genres), \(country), \(length)"
    }
    
    var slogan: String? {
        selectedFilm?.slogan
    }
    
    var description: String {
        selectedFilm?.description ?? ""
    }
    
    // MARK: id for animation
    
    var animationImageId: String {
        "\(selectedFilm?.filmId ?? 0) image"
    }
    
    var animationCardId: String {
        "\(selectedFilm?.filmId ?? 0) card"
    }
    
    func close() {
        selectedFilm = nil
        isShow = false
    }
}
