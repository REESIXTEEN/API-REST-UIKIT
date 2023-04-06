//
//  SeriesViewModelTests.swift
//  MarvelHeroesTests
//
//  Created by Pablo Gómez on 31/3/23.
//

import XCTest

final class SeriesViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInit() throws {
        let charVm = CharacterViewModel(mock: true)
        charVm.fetchCharacters()
        let character = charVm.characters[0]
        let serieVm = SeriesViewModel(character: character , mock: true)
        serieVm.fetchCharacterSeries()
        XCTAssertNotNil(serieVm)
        XCTAssertNotNil(serieVm.series)
        XCTAssertTrue(serieVm.series.count > 0)

    }
    
    func testFetchCharacterSeries() throws {
        let charVm = CharacterViewModel(mock: true)
        charVm.fetchCharacters()
        let character = charVm.characters[0]
        let serieVm = SeriesViewModel(character: character , mock: true)
        serieVm.fetchCharacterSeries()
        let serie = ResultSeries(id: 1945, title: "Avengers: The Initiative (2007 - 2010)", description: nil, modified: "2013-03-20T17:51:27-0400", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/5/a0/514a2ed3302f5", thumbnailExtension: Extension.jpg))
        
        XCTAssertNotNil(serie)
        XCTAssertEqual(serie, serieVm.series[0])

    }
    
    func testFetchCharacterSeriesError() throws {
        let charVm = CharacterViewModel(mock: true)
        charVm.fetchCharacters()
        let character = charVm.characters[0]
        let serieVm = SeriesViewModel(character: character , mock: true)
        serieVm.network = MockNetwork(file: "CharactersData", shouldFail: true)
        serieVm.fetchCharacterSeries()
        
        XCTAssertTrue(serieVm.error.status == true)

    }

}
