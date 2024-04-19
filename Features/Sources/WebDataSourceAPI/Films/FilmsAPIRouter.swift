//
//  FilmsAPIRouter.swift
//
//
//  Created by Артём Клыч on 18.04.2024.
//

import Alamofire
import Foundation
import HTTPClientAPI

public enum FilmsAPIRouter: URLRequestConvertible {
    case getTop250
}

public extension FilmsAPIRouter {
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
        case .getTop250:
            "kinopoiskTop250.json"
        }
    }
    
    private var parameterEncoder: ParameterEncoder {
        URLEncodedFormParameterEncoder()
    }
    
    private func encodeParameters(
        into request: URLRequest
    ) throws -> URLRequest {
        switch self {
        case .getTop250:
            request
        }
    }
}
