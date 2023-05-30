//
//  NewsViewModel.swift
//  IOS-Resume
//
//  Created by Torear797 on 14.01.2023.
//

import Combine
import Foundation

final class MoviesViewModel: ObservableObject {
    
    @Published private(set) var films: [Film] = []
    @Published private(set) var selectedFilm: Film?
    
    @Inject private var repository: IKinopoiskRepository
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    init() {
        getFilms()
    }
    
    func selectFilm(_ film: Film) {
        selectedFilm = film
    }
    
    private func getFilms() {
        repository.getTop250()
            .removeDuplicates()
            .sink(receiveCompletion: { _ in },
                  receiveValue: { [weak self] result in
                guard let self else { return }
                self.films = result.films
            })
            .store(in: &self.cancellableSet)
    }
}
