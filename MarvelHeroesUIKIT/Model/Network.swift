//
//  Network.swift
//  MarvelHeroes
//
//  Created by Pablo Gómez on 17/3/23.
//

import Foundation
import Combine

class Network {
    
    func fetchApiData<T>(type: T.Type, request: URLRequest) -> AnyPublisher<T, Error> where T: Decodable {
        URLSession.shared
            .dataTaskPublisher(for: request)
            .tryMap{
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return $0.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    
}

class MockNetwork: Network {
    
    let file: String
    let shouldFail: Bool
    
    init(file:String, shouldFail:Bool=false) {
        self.file = file
        self.shouldFail = shouldFail
    }
    
    override func fetchApiData<T>(type: T.Type, request: URLRequest) -> AnyPublisher<T, Error> where T : Decodable {
        if shouldFail {
            return Result<T, Error>.failure(URLError(.badServerResponse)).publisher.eraseToAnyPublisher()
        }
        
        let data = readData(filename: self.file)
        let result = Result<T, Error>.success(try! JSONDecoder().decode(T.self, from: data))
        return result.publisher.eraseToAnyPublisher()
    }
}
