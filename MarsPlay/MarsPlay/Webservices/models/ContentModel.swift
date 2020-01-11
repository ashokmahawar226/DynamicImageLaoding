//
//  ContentModel.swift
//  MarsPlay
//
//  Created by ashok Mahawar on 10/01/20.
//  Copyright © 2020 ashok Mahawar. All rights reserved.
//

import Foundation

class ContentResult: Codable {
    let Search : [ContentModel]
    let Response : String
    let totalResults : String
    init(Search : [ContentModel],Response : String,totalResults : String) {
        self.Search = Search
        self.Response = Response
        self.totalResults = totalResults
    }
    
}

class ContentModel : Codable {
    var title : String?
    var year : String?
    var imdbID : String?
    var type :String?
    var poster : String?
    
    init(title : String,year : String,imdbID : String,type : String, poster : String) {
        self.type = type
        self.year = year
        self.imdbID = imdbID
        self.title = title
        self.poster = poster

    }
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID = "imdbID"
        case type = "Type"
        case poster = "Poster"
        
    }
}
