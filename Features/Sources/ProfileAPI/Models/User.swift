//
//  User.swift
//
//
//  Created by Артём Клыч on 19.04.2024.
//

import Foundation

public struct User: Identifiable, Equatable {
    public let id: Int
    public let firstName: String
    public let lastName: String
    public let gitHub: String
    public let avatar: String
    
    public var avatarURL: URL? {
        URL(string: avatar)
    }
    
    public var fio: String {
        firstName + " " + lastName
    }
    
    public init(
        id: Int,
        firstName: String,
        lastName: String,
        gitHub: String,
        avatar: String
    ) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.gitHub = gitHub
        self.avatar = avatar
    }
}
