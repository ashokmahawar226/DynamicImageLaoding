//
//  WSRequestManager.swift
//  MarsPlay
//
//  Created by ashok Mahawar on 10/01/20.
//  Copyright © 2020 ashok Mahawar. All rights reserved.
//

import Foundation

class WSRequestManager: NSObject {
    var endPoint : String = ""
    
    init(_ endPoint : String) {
        self.endPoint = endPoint
    }
    
   
    
    func prePareRequest() -> URLRequest? {
        return nil
    }
    
    func getBodyParameter() -> String {
        return ""
    }
    
    func prePareUrl() -> String {
        return ""
    }
}
