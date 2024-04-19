//
//  FilmsListViewModel.swift
//
//
//  Created by Артём Клыч on 18.04.2024.
//

import CFFoundation
import DependencyInjection
import Foundation
import FilmsAPI

public extension FilmsList {
    @MainActor final class ViewModel: RootViewModel {
        
        // MARK: Constants
        
        public let topViewID = "filmsTopViewID"
        
        // MARK: Published
        
        @Published private(set) var films: [Film] = []
        
        // MARK: DI
        
        @Inject private var repository: FilmsRepository
        @Inject private var filmViewer: FilmViewer
        
        // MARK: Init
        
        public init() {
            getFilms()
        }
        
        // MARK: Public Methods
        
        func didTap(film: Film) {
            filmViewer.present(film: film)
        }
        
        // MARK: Private Methods
        
        private func getFilms() {
            Task {
                films = try await repository.getTop250()
            }
        }
    }
}
