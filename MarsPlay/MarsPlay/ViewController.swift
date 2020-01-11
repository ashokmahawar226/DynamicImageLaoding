//
//  ViewController.swift
//  MarsPlay
//
//  Created by ashok Mahawar on 10/01/20.
//  Copyright © 2020 ashok Mahawar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onTapMe(_ sender: UIButton) {
        let storyboard : UIStoryboard = UIStoryboard.init(name: "Main", bundle: Bundle.init(for: ViewController.self))
        let vc : DashboardVC = storyboard.instantiateViewController(withIdentifier: "DashboardVC") as! DashboardVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

