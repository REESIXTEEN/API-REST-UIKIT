//
//  BaseNetwork.swift
//  MarvelHeroes
//
//  Created by Pablo Gómez on 27/3/23.
//

import Foundation

let server = "https://gateway.marvel.com:443/"
let apikey = "d757693108c7a879f4a5186b86e48d77"
let hash = "78e85293f475d4a35479bff84e110fca"
let ts = "1"

struct HTTPMethods {
    static let post = "POST"
    static let get = "GET"
    static let put = "PUT"
    static let delete = "DELETE"
    static let content = "application/json"
}

enum endpoints : String {
    case characters = "v1/public/characters"
//    case characterSeries(String) = "v1/public/characters/{characterId}/series"
}


struct BaseNetwork {
    
    func getCharacters() -> URLRequest {
        let urlString : String = "\(server)\(endpoints.characters.rawValue)"
 
        var urlComponents = URLComponents(string: urlString)!
        urlComponents.queryItems = [
            URLQueryItem(name: "apikey", value: apikey),
            URLQueryItem(name: "hash", value: hash),
            URLQueryItem(name: "ts", value: ts)
        ]
        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = HTTPMethods.get

        return request
    }
    
    func getCharacterSeries(characterId: String) -> URLRequest {
        let urlString : String = "\(server)\(endpoints.characters.rawValue)/\(characterId)/series"
 
        var urlComponents = URLComponents(string: urlString)!
        urlComponents.queryItems = [
            URLQueryItem(name: "apikey", value: apikey),
            URLQueryItem(name: "hash", value: hash),
            URLQueryItem(name: "ts", value: ts)
        ]
        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = HTTPMethods.get

        return request
    }
}












