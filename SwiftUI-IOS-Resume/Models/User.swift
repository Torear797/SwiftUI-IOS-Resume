//
//  User.swift
//  IOS-Resume
//
//  Created by Torear797 on 29.05.2023.
//

import Foundation

struct User: Identifiable, Codable, Equatable {
    let id: Int
    let firstName: String
    let lastName: String
    let gitHub: String
    let avatar: String
    
    var avatarURL: URL? {
        URL(string: avatar)
    }
    
    var fio: String {
        firstName + " " + lastName
    }
}
