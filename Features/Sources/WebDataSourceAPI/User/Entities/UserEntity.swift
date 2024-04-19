//
//  UserEntity.swift
//
//
//  Created by Артём Клыч on 19.04.2024.
//

import Foundation

public struct UserEntity: Decodable {
    public let id: Int
    public let firstName: String
    public let lastName: String
    public let gitHub: String
    public let avatar: String
}
