//
//  NetworkError.swift
//  e-rp_mobile_ios
//
//  Created by Torear797 on 06.12.2022.
//

import Alamofire
import Foundation

struct NetworkError: Error {
    let initialError: AFError
    let backendError: [BackendError]?
    
    init<T: Codable>(response: DataResponsePublisher<T>.Output, error: AFError) {
        let backendError = response.data.flatMap {
            try? JSONDecoder().decode(Array<BackendError>.self, from: $0)
        }
        self.initialError = error
        self.backendError = backendError
    }
}

struct BackendError: Codable, Error {
    let Key: String?
    let Message: String?
    let Code: String?
}
