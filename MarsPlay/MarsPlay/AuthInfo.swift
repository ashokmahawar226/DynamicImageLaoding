//
//  AuthInfo.swift
//  MarsPlay
//
//  Created by ashok Mahawar on 10/01/20.
//  Copyright © 2020 ashok Mahawar. All rights reserved.
//

import Foundation
class AuthInfo: NSObject {
    static let shared = AuthInfo.init()
    private let API_KEY : String = "eeefc96f"
    private let BASE_URL : String = "http://www.omdbapi.com/"

    private override init() {
        
    }
    
    func getApiKey() -> String {
        return API_KEY
    }
    
    func getBaseUrl() -> String {
        return BASE_URL
    }
}
