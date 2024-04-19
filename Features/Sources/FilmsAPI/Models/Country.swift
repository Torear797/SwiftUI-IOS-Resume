//
//  Country.swift
//  
//
//  Created by Артём Клыч on 18.04.2024.
//

import Foundation

public struct Country: Codable, Equatable {
    public let country: String
    
    public init(country: String) {
        self.country = country
    }
}
