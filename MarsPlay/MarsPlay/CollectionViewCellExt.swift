//
//  CollectionViewCellExt.swift
//  MarsPlay
//
//  Created by ashok Mahawar on 10/01/20.
//  Copyright © 2020 ashok Mahawar. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func imageLoad(_ url : String){
        if let d = DataBase.shared.fetchUserInformation(url) {
            self.image = UIImage.init(data: d as Data)
        } else {
            URLSession.shared.dataTask(with: URL.init(string: url)!) { (data, response, error) in
                    guard let data = data, error == nil else { return }
                    DispatchQueue.main.async {
                        let urlRes : String = "\(response!.url!)"
                        DataBase.shared.insertUserInfomation(data as NSData, url: urlRes)
                      self.image = UIImage.init(data: data)
                    }
                }.resume()
            }
        }
        
}
