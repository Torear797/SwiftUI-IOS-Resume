//
//  NetworkConfig.swift
//  IOS-Resume
//
//  Created by Torear797 on 14.01.2023.
//

import Foundation

struct NetworkConfig {
    
    //Корневой url
    static let baseUrl = "https://torear797.github.io/api/"
    
    //Поля заголовка
    enum HttpHeaderField: String {
        case authentication = "Authorization"
        case contentType = "Content-Type"
        case acceptType = "Accept"
        case acceptEncoding = "Accept-Encoding"
    }
    
    //Тип контента
    enum ContentType: String {
        case json = "application/json"
    }
}
