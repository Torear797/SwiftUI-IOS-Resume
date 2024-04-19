//
//  UserMapper.swift
//
//
//  Created by Артём Клыч on 19.04.2024.
//

import CFFoundation
import Foundation
import ProfileAPI
import WebDataSourceAPI

final class UserMapper: Mapper {
    typealias InputType = UserEntity
    typealias OutputType = User
    
    func map(to inputData: InputType) -> OutputType? {
        User(
            id: inputData.id,
            firstName: inputData.firstName,
            lastName: inputData.lastName,
            gitHub: inputData.gitHub,
            avatar: inputData.avatar
        )
    }
}
