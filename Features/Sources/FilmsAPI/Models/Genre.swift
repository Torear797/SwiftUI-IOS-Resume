//
//  Genre.swift
//  
//
//  Created by Артём Клыч on 18.04.2024.
//

import Foundation

public struct Genre: Codable, Equatable {
    public let genre: String
    
    public init(genre: String) {
        self.genre = genre
    }
}
