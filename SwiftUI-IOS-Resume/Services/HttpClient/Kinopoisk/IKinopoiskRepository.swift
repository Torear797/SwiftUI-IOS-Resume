//
//  IKinopoiskRepository.swift
//  IOS-Resume
//
//  Created by Torear797 on 14.01.2023.
//

import Combine

protocol IKinopoiskRepository {
    func getTop250() -> AnyPublisher<ResultTop250, Error>
}
