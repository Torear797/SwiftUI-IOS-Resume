//
//  DeviceApi.swift
//  IOS-Resume
//
//  Created by Torear797 on 29.01.2023.
//

import Alamofire
import Foundation

enum DeviceAPI: URLRequestConvertible {
    case getAppleDevices
}

extension DeviceAPI {
    func asURLRequest() throws -> URLRequest {
        let url = try baseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        //Http method
        urlRequest.httpMethod = method.rawValue
        
        urlRequest.setValue(
            NetworkConfig.ContentType.json.rawValue,
            forHTTPHeaderField: NetworkConfig.HttpHeaderField.acceptType.rawValue
        )
        
        urlRequest.setValue(
            NetworkConfig.ContentType.json.rawValue,
            forHTTPHeaderField: NetworkConfig.HttpHeaderField.contentType.rawValue
        )
        
        //Encoding
        let encoding: ParameterEncoding = {
            switch method {
            case .get:
                return URLEncoding.default
            default:
                return JSONEncoding.default
            }
        }()
        
        return try encoding.encode(urlRequest, with: nil)
    }
    
    private var method: HTTPMethod {
        switch self {
        case .getAppleDevices:
            return .get
        }
    }
    
    //MARK: - Path
    private var path: String {
        switch self {
        case .getAppleDevices:
            return "devices/apple/devicesList.json"
        }
    }
    
    //MARK: - Base URL
    private var baseURL: String {
        NetworkConfig.baseUrl
    }
}
