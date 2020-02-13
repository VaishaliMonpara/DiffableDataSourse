//
//  CollectionViewController.swift
//  DiffableDataSourceDemo
//
//  Created by MAC0008 on 13/02/20.
//  Copyright © 2020 MAC0008. All rights reserved.
//

import UIKit

private let reuseIdentifier = "collectionViewCell"

class CollectionViewController: UIViewController {

    @IBOutlet weak var collView: UICollectionView!
    
    var countries: [Country] = []
    var dataSource: UICollectionViewDiffableDataSource<Section, Country>!
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

        dataSource = UICollectionViewDiffableDataSource<Section, Country>(collectionView: collView) {
                (collectionView: UICollectionView, indexPath: IndexPath,
                country: Country) -> CollectionViewCell? in
                guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: reuseIdentifier, for: indexPath) as? CollectionViewCell else {
                        fatalError("Cannot create new cell") }
                cell.descriptionLabel.text = country.name
                let screenWidth = collectionView.frame.size.width
                cell.widthConstraints.constant = (screenWidth/2.0) - (2 * 16.0)
                return cell
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        performSearch(searchQuery: nil)
    }

    func performSearch(searchQuery: String?) {
           let filteredCountries: [Country]
           if let searchQuery = searchQuery, !searchQuery.isEmpty {
               filteredCountries = countries.filter { $0.contains(query: searchQuery) }
           } else {
               filteredCountries = countries
           }
           var snapshot = NSDiffableDataSourceSnapshot<Section, Country>()
           snapshot.appendSections([.main])
           snapshot.appendItems(filteredCountries, toSection: .main)
           dataSource.apply(snapshot, animatingDifferences: true)
       }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}

extension CollectionViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        performSearch(searchQuery: searchText)
    }
}
