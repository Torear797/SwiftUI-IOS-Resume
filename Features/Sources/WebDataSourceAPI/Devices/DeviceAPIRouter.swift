//
//  DeviceAPIRouter.swift
//
//
//  Created by Артём Клыч on 19.04.2024.
//

import Alamofire
import Foundation
import HTTPClientAPI

public enum DeviceAPIRouter: URLRequestConvertible {
    case getAppleDevices
}

public extension DeviceAPIRouter {
    func asURLRequest() throws -> URLRequest {
        let url = try BackendConfig.baseURL.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.method = method
        urlRequest.headers.add(.contentType(
            HTTPClientConfig.ContentType.json.rawValue
        ))
        return try encodeParameters(into: urlRequest)
    }
    
    private var method: HTTPMethod {
        .get
    }
    
    private var path: String {
        switch self {
        case .getAppleDevices:
            "devices/apple/devicesList.json"
        }
    }
    
    private var parameterEncoder: ParameterEncoder {
        URLEncodedFormParameterEncoder()
    }
    
    private func encodeParameters(
        into request: URLRequest
    ) throws -> URLRequest {
        switch self {
        case .getAppleDevices:
            request
        }
    }
}

