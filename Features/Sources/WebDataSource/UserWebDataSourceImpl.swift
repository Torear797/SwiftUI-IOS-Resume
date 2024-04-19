//
//  UserWebDataSourceImpl.swift
//
//
//  Created by Артём Клыч on 19.04.2024.
//

import Foundation
import ProfileAPI
import HTTPClientAPI
import WebDataSourceAPI

struct UserWebDataSourceImpl: UserWebDataSource {
    private let httpClient: HTTPClient
    private let userMapper = UserMapper()
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func getUser() async throws -> ProfileAPI.User {
        let route = UserAPIRouter.getUser
        
        guard let result: UserEntity = try? await httpClient.request(route) else {
            throw WebServiceError.requestError
        }
        
        guard let user = userMapper.map(to: result) else {
            throw WebServiceError.mapError
        }
        
        return user
    }
}
