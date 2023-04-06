//
//  NetworkTests.swift
//  MarvelHeroesTests
//
//  Created by Pablo Gómez on 31/3/23.
//

import XCTest
import Combine

final class NetworkTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMock() throws {
        let expectation = self.expectation(description: "Get characters")
        let request = BaseNetwork().getCharacters()
        let mockNetwork = MockNetwork(file: "CharactersData")
        
        XCTAssertEqual(mockNetwork.file, "CharactersData")
        XCTAssertEqual(mockNetwork.shouldFail, false)
            
        let publisher: AnyPublisher<Characters, Error> = mockNetwork.fetchApiData(type: Characters.self, request: request)
        
        let cancellable = publisher.sink(receiveCompletion: { completion in
            switch completion {
            case .failure(let error):
                expectation.fulfill()
                XCTFail("Error test: \(error.localizedDescription)")
            case .finished:
                expectation.fulfill()
                XCTAssertEqual(true, true)
            }
        }, receiveValue: { value in
            
        })
        
        self.waitForExpectations(timeout: 5)
        cancellable.cancel()
        
    }
    
    func testMockError() throws {
        let expectation = self.expectation(description: "Get characters")
        let request = BaseNetwork().getCharacters()
        let mockNetwork = MockNetwork(file: "CharactersData", shouldFail: true)
        XCTAssertEqual(mockNetwork.file, "CharactersData")
        XCTAssertEqual(mockNetwork.shouldFail, true)
        
        let publisher: AnyPublisher<Characters, Error> = mockNetwork.fetchApiData(type: Characters.self, request: request)
        
        let cancellable = publisher.sink(receiveCompletion: { completion in
            switch completion {
            case .failure:
                expectation.fulfill()
                XCTAssertEqual(true, true)
            case .finished:
                expectation.fulfill()
                XCTFail("Error test")
            }
        }, receiveValue: { value in
            
        })
        
        self.waitForExpectations(timeout: 5)
        cancellable.cancel()
    }


}
