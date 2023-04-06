//
//  CharactersTableViewController.swift
//  MarvelHeroesUIKIT
//
//  Created by Pablo Gómez on 4/4/23.
//

import UIKit
import Combine

class CharactersTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    

    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    let viewModel: CharacterViewModel = CharacterViewModel()
    private var subscriptions = Set<AnyCancellable>()
    
//    var characters: [ResultCharacter] = []
//    var searchedCharacters: [ResultCharacter] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        
        navigationItem.title = "Marvel Characters"
        
        let xib = UINib(nibName: "CharacterTableViewCell", bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: "customTableCell")
        
        viewModel.$characters.receive(on: DispatchQueue.main)
            .sink { data in
                self.tableView.reloadData()
            }.store(in: &subscriptions)

        viewModel.fetchCharacters()

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customTableCell", for: indexPath) as! CharacterTableViewCell
        let character = viewModel.characters[indexPath.row]
        let urlImage = character.thumbnail.path + "." + character.thumbnail.thumbnailExtension.rawValue
        cell.imageCell.setImage(url: urlImage)
        cell.name.text = character.name
//        cell.accessoryType = .none
        cell.selectionStyle = .none
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.characters.count
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let character = viewModel.characters[indexPath.row]
        let seriesVm = SeriesViewModel(character: character)
        let seriesView = SeriesTableViewController()
        seriesView.viewModel = seriesVm
        navigationController?.pushViewController(seriesView, animated: true)
    }
    
    
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
//        searchedHeroes = searchText.isEmpty ? heroes : heroes.filter { heroe in
//            return heroe.name?.range(of: searchText, options: .caseInsensitive, range: nil,locale: nil) != nil
//        }
//        tableView.reloadData()
//    }
    
}
