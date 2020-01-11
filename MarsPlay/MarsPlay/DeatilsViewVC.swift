//
//  DeatilsViewVC.swift
//  MarsPlay
//
//  Created by ashok Mahawar on 11/01/20.
//  Copyright © 2020 ashok Mahawar. All rights reserved.
//

import UIKit

class DeatilsViewVC: UIViewController {

    @IBOutlet weak var imageDetialView: UIImageView!
    @IBOutlet weak var yearLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    var content : ContentModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        imageDetialView.imageLoad(content?.poster ?? "")
        titleLbl.text = "Title : " + (content?.title ?? "")
        typeLbl.text = "Type : " + (content?.type ?? "")
        yearLbl.text = "\(2019 - (Int.init(content?.year ?? "") ?? 2019)) years ago"
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func goBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
