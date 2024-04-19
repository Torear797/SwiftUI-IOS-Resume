//
//  NetworkVoidAnswer.swift
//  
//
//  Created by Артём Клыч on 08.12.2022.
//

import Alamofire

public struct NetworkVoidAnswer: Codable, EmptyResponse {
    public static func emptyValue() -> NetworkVoidAnswer {
        NetworkVoidAnswer.init()
    }
}
