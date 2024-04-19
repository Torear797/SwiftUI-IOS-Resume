//
//  URLWithJSONParameterEncoder.swift
//  
//
//  Created by Артём Клыч on 30.01.2024.
//

import Alamofire
import Foundation

public struct URLWithJSONParameterEncoder: ParameterEncoder {
    private let params: [String : String]
    private let encoder = JSONParameterEncoder()
    
    public init(params: [String : String]) {
        self.params = params
    }
    
    public func encode<Parameters>(
        _ parameters: Parameters?,
        into request: URLRequest
    ) throws -> URLRequest where Parameters : Encodable {
        guard let parameters else { return request }

        var request = request

        guard let url = request.url else {
            throw AFError.parameterEncoderFailed(reason: .missingRequiredComponent(.url))
        }
        
        if var components = URLComponents(url: url, resolvingAgainstBaseURL: false) {
            let queryItems = params.map {
                URLQueryItem(name: $0.key, value: $0.value)
            }
            
            components.queryItems = queryItems
            
            guard let newURL = components.url else {
                throw AFError.parameterEncoderFailed(reason: .missingRequiredComponent(.url))
            }

            request.url = newURL
            request.httpBody = try encoder.encode(parameters, into: request).httpBody
        }
        
        return request
    }
}
