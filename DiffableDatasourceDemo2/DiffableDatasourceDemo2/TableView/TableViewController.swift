//
//  TableViewController.swift
//  DiffableDatasourceDemo2
//
//  Created by MAC0008 on 13/02/20.
//  Copyright © 2020 MAC0008. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    
    var languages : [Language] = []
    var dataSource : UITableViewDiffableDataSource<section, Language>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        for languagename in LanguageNames
        {
            languages.append(Language(languageName: languagename))
        }
        
        dataSource = UITableViewDiffableDataSource<section, Language>(tableView: tblView){
            (tableView: UITableView, indexPath: IndexPath, language: Language) -> UITableViewCell? in
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
            cell.textLabel?.text = language.languageName
            return cell
        }
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        performSearchLanguage(searchText: nil)
    }

}

extension TableViewController: UISearchBarDelegate
{
    func performSearchLanguage(searchText: String?){
        let filteredlanguage: [Language]
        if let searchquery = searchText, !searchquery.isEmpty {
            filteredlanguage = languages.filter({ $0.contains(query: searchquery)})
        }else {
            filteredlanguage = languages
        }
        
        var snapshot = NSDiffableDataSourceSnapshot<section, Language>()
        snapshot.appendSections([.main])
        snapshot.appendItems(filteredlanguage, toSection: .main)
        dataSource.apply(snapshot, animatingDifferences: true, completion: nil)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        performSearchLanguage(searchText: searchText)
    }
}
