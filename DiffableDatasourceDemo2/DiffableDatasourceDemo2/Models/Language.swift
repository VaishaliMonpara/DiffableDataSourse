//
//  Language.swift
//  DiffableDatasourceDemo2
//
//  Created by MAC0008 on 13/02/20.
//  Copyright © 2020 MAC0008. All rights reserved.
//

import Foundation

struct Language : Hashable {
    let languageName: String
    let identifire = UUID()
    
    func hash(into hasher: inout Hasher){
        hasher.combine(identifire)
    }
    
    static func ==(lhs: Language, rhs: Language) -> Bool{
        return lhs.identifire == rhs.identifire
    }
    
    func contains(query: String?) -> Bool{
        guard let query = query else {
            return true
        }
        guard !query.isEmpty else {return true}
        let lowerCasedQuery = query.lowercased()
        return languageName.lowercased().contains(lowerCasedQuery)
    }
    
    
    /* 1. Make sure any custom type conforms to Hashable This is important for diffable data source to work
    
      2.Every custom type should have the unique identifier. In this case I have used UUID as a unique identifier for objects of Country type
    
      3.The object must also conform to Equatable protocol

      4.We also have a utility method named contains which when passed the substring will return if it matches with the name of the underlying country object */
}

enum section: CaseIterable
{
    case main
}

let LanguageNames = ["English",
                     "French",
                     "German",
                     "Italian",
                     "Dutch",
                     "Swedish",
                     "Spanish",
                     "Danish",
                     "Portuguese",
                     "Norwegian",
                     "Hebrew",
                     "Japanese",
                     "Arabic",
                     "Finnish",
                     "Greek",
                     "Icelandic",
                     "Maltese",
                     "Turkish",
                     "Croatian",
                     "Chinese",
                     "Urdu",
                     "Hindi",
                     "Thai",
                     "Korean",
                     "Lithuanian",
                     "Polish",
                     "Hungarian",
                     "Estonian",
                     "Latvian",
                     "Sami",
                     "Faroese",
                     "Farsi",
                     "Russian",
                     "Chinese",
                     "Dutch",
                     "Irish",
                     "Albanian",
                     "Romanian",
                     "Czech",
                     "Slovak",
                     "Slovenian",
                     "Yiddish",
                     "Serbian",
                     "Macedonian",
                     "Bulgarian",
                     "Ukrainian",
                     "Byelorussian",
                     "Uzbek",
                     "Kazakh",
                     "Azerbaijani",
                     "Azerbaijani",
                     "Armenian",
                     "Georgian",
                     "Moldavian",
                     "Kirghiz",
                     "Tajiki",
                     "Turkmen",
                     "Mongolian",
                     "Mongolian",
                     "Pashto",
                     "Kurdish",
                     "Kashmiri",
                     "Sindhi",
                     "Tibetan",
                     "Nepali",
                     "Sanskrit",
                     "Marathi",
                     "Bengali",
                     "Assamese",
                     "Gujarati",
                     "Punjabi",
                     "Oriya",
                     "Malayalam",
                     "Kannada",
                     "Tamil",
                     "Telugu",
                     "Sinhalese",
                     "Burmese",
                     "Khmer",
                     "Lao",
                     "Vietnamese",
                     "Indonesian",
                     "Tagalog",
                     "Malay",
                     "Malay",
                     "Amharic",
                     "Tigrinya",
                     "Oromo",
                     "Somali",
                     "Swahili",
                     "Kinyarwanda",
                     "Rundi",
                     "Nyanja",
                     "Malagasy",
                     "Esperanto",
                     "Welsh",
                     "Basque",
                     "Catalan",
                     "Latin",
                     "Quechua",
                     "Guarani",
                     "Aymara",
                     "Tatar",
                     "Uighur",
                     "Dzongkha",
                     "Javanese",
                     "Sundanese",
                     "Galician",
                     "Afrikaans",
                     "Breton",
                     "Inuktitut",
                     "Scottish",
                     "Manx",
                     "Irish",
                     "Tongan",
                     "Greek",
                     "Greenlandic",
                     "Azerbaijani",
                     "Nynorsk"]


