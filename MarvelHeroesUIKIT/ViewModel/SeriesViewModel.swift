//
//  SeriesViewModel.swift
//  MarvelHeroes
//
//  Created by Pablo Gómez on 29/3/23.
//

import Foundation
import Combine


class SeriesViewModel: ObservableObject {
    
    @Published var series: [ResultSeries] = []
    @Published var error = vmError()
    var network : Network
    let baseNetwork = BaseNetwork()
    var suscriptors = Set<AnyCancellable>()
    var character: ResultCharacter
    
    init(character:ResultCharacter,mock:Bool = false){
        if mock {
            self.network = MockNetwork(file: mockFilesData.series.rawValue)
        }else {
            self.network = Network()
        }
        self.character = character
    }
    
    func fetchCharacterSeries() {
        let request = baseNetwork.getCharacterSeries(characterId: String(character.id))
        network.fetchApiData(type: CharacterSeries.self, request: request)
            .sink { completion in
                switch completion{
                case .failure:
                    debugPrint("Error getting the character series")
                    self.error.description = "Error getting the marvel series from the Marvel API"
                    self.error.status = true
                case .finished:
                    debugPrint("Success getting the character series")
                    self.error.status = false
                }
            } receiveValue: { data in
                self.series = data.data.results
            }
            .store(in: &suscriptors)

        
    }
}
