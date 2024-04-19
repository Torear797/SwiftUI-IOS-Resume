//
//  HTTPClient.swift
//  
//
//  Created by Артём Клыч on 24.07.2023.
//

import Alamofire
import Combine

public protocol HTTPClient {
    func request<T: Decodable>(
        _ urlConvertible: URLRequestConvertible
    ) -> AnyPublisher<T, Error>
    
    func request<T: Decodable>(
        _ urlConvertible: URLRequestConvertible
    ) async throws -> T
}
