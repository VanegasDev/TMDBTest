//
//  NetworkRequester.swift
//  TMDBTest
//
//  Created by Mario Vanegas on 15/3/24.
//

import Foundation
import Combine

protocol NetworkRequesterType {
    func request(_ target: TargetType) -> AnyPublisher<Data, Error>
}

struct NetworkRequester: NetworkRequesterType {
    func request(_ target: TargetType) -> AnyPublisher<Data, Error> {
        guard let url = URL(string: target.baseURL + target.path) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = target.method.rawValue
        
        target.headers?.forEach { header in
            request.setValue(header.value, forHTTPHeaderField: header.key)
        }
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode >= 200 else {
                    throw URLError(.badServerResponse)
                }
                
                return data
            }
            .mapError { $0 }
            .eraseToAnyPublisher()
    }
}

// Extension to decode the response
extension NetworkRequesterType {
    func request<T: Decodable>(_ target: TargetType) -> AnyPublisher<T, Error> {
        request(target)
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
