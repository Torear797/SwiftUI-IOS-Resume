//
//  FilmViewModel.swift
//  IOS-Resume
//
//  Created by Torear797 on 15.01.2023.
//

import Foundation

final class FilmViewModel: ObservableObject {
    
    let film: Film
    let isFullScreen: Bool
    
    var info: String {
        "\(film.nameEn ?? film.nameRu), \(film.year), \(film.filmLength)"
    }
    
    init(_ film: Film, isFullScreen: Bool) {
        self.film = film
        self.isFullScreen = isFullScreen
    }
    
    // MARK: id for animation
    
    var animationImageId: String {
        "\(film.filmId) image"
    }
    
    var animationCardId: String {
        "\(film.filmId) card"
    }
}
