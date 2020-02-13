//
//  TableViewController.swift
//  DiffableDataSourceDemo
//
//  Created by MAC0008 on 13/02/20.
//  Copyright © 2020 MAC0008. All rights reserved.
//

import UIKit


enum Section: CaseIterable {
    case main
}


class TableViewController: UIViewController,UISearchBarDelegate {

    @IBOutlet weak var tblView: UITableView!
    
    
    var countries: [Country] = []
    var dataSource: UITableViewDiffableDataSource<Section, Country>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let countryNames = ["Afghanistan",
        "Albania",
        "Algeria",
        "Andorra",
        "Angola",
        "Antigua and Barbuda",
        "Argentina",
        "Armenia",
        "Australia",
        "Austria",
        "Azerbaijan",
        "Bahamas",
        "Bahrain",
        "Bangladesh",
        "Barbados",
        "Belarus"]
        
        for name in countryNames {
            countries.append(Country(name: name))
        }
        
        dataSource = UITableViewDiffableDataSource
            <Section, Country>(tableView: tblView) {
                (tableView: UITableView, indexPath: IndexPath,
                country: Country) -> UITableViewCell? in
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
                cell.textLabel?.text = country.name
                return cell
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        performSearch(searchQuery: nil)
    }

    /* 1.First off, we check if user has entered at least one character in search bar or not. If search bar is cleared, we populate table view with the list of original countries
    
      2.If there is at least one character entered, we also do case-insensitive search on the list of country items
      3.We create a snapshot representing current state of data - In this case, list of filtered countries based on the input search string
      4.Next, we apply that snapshot to existing data source which takes care of reloading tableView with filtered list of items
      5.In order to be able to see the initial state, we will call performSearch from viewDidLayoutSubviews method with nil searchQuery which will show the original list of all the countries */

    func performSearch(searchQuery: String?){
        let filteredCountries: [Country]
        if let searchQuery = searchQuery, !searchQuery.isEmpty {
            filteredCountries = countries.filter({ $0.contains(query: searchQuery)})
        } else {
            filteredCountries = countries
        }
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Country>()
        snapshot.appendSections([.main])
        snapshot.appendItems(filteredCountries, toSection: .main)
        dataSource.apply(snapshot, animatingDifferences: true, completion: nil)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        performSearch(searchQuery: searchText)
    }
}

