//
//  FilmViewer.swift
//
//
//  Created by Артём Клыч on 18.04.2024.
//

import Combine
import Foundation

public protocol FilmViewer {
    var film: Film? { get }
    var filmPublisher: Published<Film?>.Publisher { get }
    
    func present(film: Film)
    func dismiss()
}
