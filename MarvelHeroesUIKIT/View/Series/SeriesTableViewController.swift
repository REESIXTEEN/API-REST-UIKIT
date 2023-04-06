//
//  SeriesTableViewController.swift
//  MarvelHeroesUIKIT
//
//  Created by Pablo Gómez on 4/4/23.
//

import UIKit
import Combine

class SeriesTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: SeriesViewModel!
    private var subscriptions = Set<AnyCancellable>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        navigationItem.title = viewModel.character.name
        
        let xib = UINib(nibName: "SerieTableViewCell", bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: "customTableCell")
        
        viewModel.$series.receive(on: DispatchQueue.main)
            .sink { data in
                self.tableView.reloadData()
            }.store(in: &subscriptions)

        viewModel.fetchCharacterSeries()

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customTableCell", for: indexPath) as! SerieTableViewCell
        let serie = viewModel.series[indexPath.row]
        let urlImage = serie.thumbnail.path + "." + serie.thumbnail.thumbnailExtension.rawValue
        cell.imageCell.setImage(url: urlImage)
        cell.titleCell.text = serie.title
        cell.descriptionCell.text = serie.description
//        cell.accessoryType = .none
        cell.selectionStyle = .none
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.series.count
    }
    
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let heroe = searchedHeroes[indexPath.row]
//        let detailsView = DetailViewController()
//        detailsView.heroe = heroe
//        navigationController?.pushViewController(detailsView, animated: true)
//    }
    
    
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
//        searchedHeroes = searchText.isEmpty ? heroes : heroes.filter { heroe in
//            return heroe.name?.range(of: searchText, options: .caseInsensitive, range: nil,locale: nil) != nil
//        }
//        tableView.reloadData()
//    }
    
}
