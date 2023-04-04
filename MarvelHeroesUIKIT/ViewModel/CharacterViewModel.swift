//
//  HomeViewModel.swift
//  MarvelHeroes
//
//  Created by Pablo Gómez on 17/3/23.
//

import Foundation
import Combine

final class CharacterViewModel : ObservableObject{
    
    @Published var characters: [ResultCharacter] = []
    @Published var error = vmError()
    var network: Network
    let baseNetwork = BaseNetwork()
    var suscriptors = Set<AnyCancellable>()
    
        
    init(mock:Bool = false){
        if mock {
            self.network = MockNetwork(file: mockFilesData.characters.rawValue)
        }else {
            self.network = Network()
        }
    }
    
    func fetchCharacters() {
        let request = baseNetwork.getCharacters()
        network.fetchApiData(type: Characters.self, request: request)
            .sink { completion in
                switch completion{
                case .failure:
                    debugPrint("Error getting the marvel characters")
                    self.error.description = "Error getting the marvel characters from the Marvel API"
                    self.error.status = true
                case .finished:
                    debugPrint("Success getting the marvel characters")
                    self.error.status = false
                }
            } receiveValue: { data in
                self.characters = data.data.results
            }
            .store(in: &suscriptors)

    }
    

    
    
    
    
}
