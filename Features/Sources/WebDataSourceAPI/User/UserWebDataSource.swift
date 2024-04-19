//
//  UserWebDataSource.swift
//
//
//  Created by Артём Клыч on 19.04.2024.
//

import Foundation
import ProfileAPI

public protocol UserWebDataSource {
    func getUser() async throws -> User
}
