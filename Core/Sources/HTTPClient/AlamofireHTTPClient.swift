import Alamofire
import Combine
import Foundation
import HTTPClientAPI

public final class AlamofireHTTPClient: HTTPClient  {
    private var session: Session
    
    public init() {
        let evaluators: [String: ServerTrustEvaluating] = [
            "torear797.github.io": DisabledTrustEvaluator(),
        ]
        let trustManager = ServerTrustManager(evaluators: evaluators)
        session = Session(serverTrustManager: trustManager)
    }
    
    public func request<T: Decodable>(
        _ urlConvertible: URLRequestConvertible
    ) -> AnyPublisher<T, Error> {
        session
            .request(urlConvertible)
            .validate()
        //            .cURLDescription { description in
        //                debugPrint(description)
        //            }
//                    .responseDecodable(of: T.self) { response in
//                        debugPrint(response)
//                    }
            .publishDecodable(type: T.self)
            .value()
            .mapError { $0 }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    public func request<T: Decodable>(
        _ urlConvertible: URLRequestConvertible
    ) async throws -> T {
        try await session
            .request(urlConvertible)
            .validate()
//            .cURLDescription { description in
//                debugPrint(description)
//            }
//            .responseDecodable(of: T.self) { response in
//                debugPrint(response)
//            }
            .serializingDecodable(T.self)
            .value
    }
}
