//
//  NetworkVoidAnswer.swift
//  IOS-Resume
//
//  Created by Torear797 on 08.12.2022.
//

import Alamofire

struct NetworkVoidAnswer: Codable, EmptyResponse {
    static func emptyValue() -> NetworkVoidAnswer {
        NetworkVoidAnswer.init()
    }
}
