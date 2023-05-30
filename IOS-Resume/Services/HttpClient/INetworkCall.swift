//
//  INetworkCall.swift
//  e-rp_mobile_ios
//
//  Created by Torear797 on 06.12.2022.
//

import Alamofire
import Combine

protocol INetworkCall {
    func request<T: Codable>(
        _ urlConvertible: URLRequestConvertible
    ) -> AnyPublisher<T, Error>
}
