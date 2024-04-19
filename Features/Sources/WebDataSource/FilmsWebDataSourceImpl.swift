//
//  FilmsWebDataSourceImpl.swift
//
//
//  Created by Артём Клыч on 18.04.2024.
//

import Foundation
import FilmsAPI
import HTTPClientAPI
import WebDataSourceAPI

struct FilmsWebDataSourceImpl: FilmsWebDataSource {
    private let httpClient: HTTPClient
    private let filmMapper = FilmMapper()
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func getTop250() async throws -> [Film] {
        let route = FilmsAPIRouter.getTop250
        
        guard let result: FilmsResponseEntity = try? await httpClient.request(route) else {
            throw WebServiceError.requestError
        }
        
        return result.films.compactMap({ filmMapper.map(to: $0) })
    }
}
