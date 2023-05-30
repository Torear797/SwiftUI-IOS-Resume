//
//  NetworkCall.swift
//  e-rp_mobile_ios
//
//  Created by Torear797 on 06.12.2022.
//

import Alamofire
import Combine
import Foundation

final class NetworkCall: INetworkCall  {
    func request<T: Codable>(
        _ urlConvertible: URLRequestConvertible
    ) -> AnyPublisher<T, Error> {
        AF.request(urlConvertible)
            .validate()
            .cURLDescription { description in
//                debugPrint(description)
            }
            .responseDecodable(of: T.self) { response in
//                debugPrint(response)
            }
            .publishDecodable(type: T.self)
            .value()
            .mapError({ error in
                error
            })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
