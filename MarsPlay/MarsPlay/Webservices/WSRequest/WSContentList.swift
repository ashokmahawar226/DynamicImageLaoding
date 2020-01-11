//
//  WSConetentList.swift
//  MarsPlay
//
//  Created by ashok Mahawar on 10/01/20.
//  Copyright © 2020 ashok Mahawar. All rights reserved.
//

import Foundation

class WSConetentList: WSRequestManager {
    var page : Int = 1

    var searchKeyWord : String = "Batman"

     init(_ page: Int) {
        super.init("")
        self.page = page
        
    }
    
    override func prePareRequest() -> URLRequest? {
        let strUrl = AuthInfo.shared.getBaseUrl() + endPoint + prePareUrl()
        let url : URL = URL.init(string: strUrl)!
        var urlRequest : URLRequest = URLRequest.init(url: url)
        urlRequest.httpMethod = "GET"
        return urlRequest
    }
    
    
    //?_start=5&_limit=10 http://www.omdbapi.com/?s=Batman&page=10&apikey=eeefc96f
    
    override func prePareUrl() -> String {
        return "?s=\(searchKeyWord)&page=\(page)&apikey=\(AuthInfo.shared.getApiKey())"
    }
}
