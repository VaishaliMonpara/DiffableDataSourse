//
//  Country.swift
//  DiffableDataSourceDemo
//
//  Created by MAC0008 on 13/02/20.
//  Copyright © 2020 MAC0008. All rights reserved.
//

import Foundation

struct Country: Hashable {
    let name: String
    let identifire = UUID()
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifire)
    }
    
    static func ==(lhs: Country, rhs: Country) -> Bool{
        return lhs.identifire == rhs.identifire
    }
    
    func contains(query: String?) -> Bool{
        guard let query = query else {return true}
        guard !query.isEmpty else {return true}
        let lowerCasedQuery = query.lowercased()
        return name.lowercased().contains(lowerCasedQuery)
    }
}

/* 1. Make sure any custom type conforms to Hashable This is important for diffable data source to work
 
   2.Every custom type should have the unique identifier. In this case I have used UUID as a unique identifier for objects of Country type
 
   3.The object must also conform to Equatable protocol

   4.We also have a utility method named contains which when passed the substring will return if it matches with the name of the underlying country object */
