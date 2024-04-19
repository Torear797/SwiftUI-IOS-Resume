//
//  HTTPClientConfig.swift
//  
//
//  Created by Артём Клыч on 24.07.2023.
//

import Foundation

public struct HTTPClientConfig {
    
    public enum HttpHeaderField: String {
        case authentication = "Authorization"
        case contentType = "Content-Type"
        case acceptType = "Accept"
        case acceptEncoding = "Accept-Encoding"
    }
    
    public enum ContentType: String {
        case json = "application/json"
    }
}
