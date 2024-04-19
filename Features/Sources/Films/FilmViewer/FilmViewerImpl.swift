//
//  FilmViewerImpl.swift
//
//
//  Created by Артём Клыч on 18.04.2024.
//

import Foundation
import FilmsAPI

final class FilmViewerImpl: FilmViewer, ObservableObject {
    @Published private(set) var film: FilmsAPI.Film?
    public var filmPublisher: Published<Film?>.Publisher { $film }
    
    func present(film: Film) {
        self.film = film
    }
    
    func dismiss() {
        film = nil
    }
}
