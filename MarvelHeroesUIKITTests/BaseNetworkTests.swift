//
//  BaseNetworkTests.swift
//  MarvelHeroesTests
//
//  Created by Pablo Gómez on 31/3/23.
//

import XCTest

final class BaseNetworkTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetCharacters() throws {
        let base = BaseNetwork()
        let request = base.getCharacters()
        
        XCTAssertNotNil(request)
        XCTAssertEqual(request.url!.absoluteString, "https://gateway.marvel.com:443/v1/public/characters?apikey=d757693108c7a879f4a5186b86e48d77&hash=78e85293f475d4a35479bff84e110fca&ts=1")
        XCTAssertEqual(request.httpMethod, HTTPMethods.get)
    }
    
    func testGetCharactersSeries() throws {
        let base = BaseNetwork()
        let request = base.getCharacterSeries(characterId: "10982")
        
        XCTAssertNotNil(request)
        XCTAssertEqual(request.url!.absoluteString, "https://gateway.marvel.com:443/v1/public/characters/10982/series?apikey=d757693108c7a879f4a5186b86e48d77&hash=78e85293f475d4a35479bff84e110fca&ts=1")
        XCTAssertEqual(request.httpMethod, HTTPMethods.get)
    }

}
