//
//  MarvelHeroesTests.swift
//  MarvelHeroesTests
//
//  Created by Pablo Gómez on 17/3/23.
//

import XCTest

final class CharacterViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInit() throws {
        let vm = CharacterViewModel(mock: true)
        vm.fetchCharacters()
        XCTAssertNotNil(vm)
        XCTAssertNotNil(vm.characters)
        XCTAssertEqual(vm.characters.count, 10)
        

    }
    
    func testFetchCharacters() throws {
        let vm = CharacterViewModel(mock: true)
        vm.fetchCharacters()
        XCTAssertNotNil(vm.characters)
        let character = ResultCharacter(id: 1011334, name: "3-D Man", description: "", modified: "2014-04-29T14:18:17-0400", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", thumbnailExtension: Extension.jpg))
        
        XCTAssertNotNil(character)
        XCTAssertEqual(character, vm.characters[0])

    }
    
    func testFetchCharactersError() throws {
        let vm = CharacterViewModel(mock: true)
        vm.network = MockNetwork(file: "CharactersData", shouldFail: true)
        vm.fetchCharacters()
        
        XCTAssertTrue(vm.error.status == true)

    }

}
