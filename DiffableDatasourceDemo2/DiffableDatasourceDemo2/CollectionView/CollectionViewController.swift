//
//  CollectionViewController.swift
//  DiffableDatasourceDemo2
//
//  Created by MAC0008 on 13/02/20.
//  Copyright © 2020 MAC0008. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController {

    @IBOutlet weak var collView: UICollectionView!
    
    var languages: [Language] = []
    var dataSoure: UICollectionViewDiffableDataSource<section, Language>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for languagename in LanguageNames
        {
            languages.append(Language(languageName: languagename))
        }
        
        dataSoure = UICollectionViewDiffableDataSource<section, Language>(collectionView: collView){
            (collectionView: UICollectionView, indexPath: IndexPath, language: Language) -> CollectionViewCell? in
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as?  CollectionViewCell else {
                fatalError("Cannot create new cell")
            }
            
            cell.lblName.text = language.languageName
            let screenWidth = collectionView.frame.size.width
            cell.widthConstraints.constant = (screenWidth/3.0) - (3 * 16.0)
           
            return cell
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.performSearch(searchText: nil)
    }
    
    func performSearch(searchText: String?)
    {
        let filteredArr : [Language]
        if let searchquery = searchText, !searchquery.isEmpty {
            filteredArr = languages.filter({ $0.contains(query: searchText)
            })
        }else{
            filteredArr = languages
        }
        
        
        var snapshot = NSDiffableDataSourceSnapshot<section, Language>()
        snapshot.appendSections([.main])
        snapshot.appendItems(filteredArr, toSection: .main)
        dataSoure.apply(snapshot, animatingDifferences: true, completion: nil)
        
    }
    
}

extension CollectionViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.performSearch(searchText: searchText)
    }
}
