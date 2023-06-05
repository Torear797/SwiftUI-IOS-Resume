//
//  Category.swift
//  IOS-Resume
//
//  Created by Torear797 on 29.01.2023.
//

import Foundation

struct Category: Identifiable, Hashable {
    
    let id: Int
    let name: String
    let description: String
    let imageURL: URL
    let items: [DeviceInfo]
}

extension Category: Equatable {
    
    static func == (lhs: Category, rhs: Category) -> Bool {
        lhs.name == rhs.name
    }
    
}
