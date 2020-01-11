//
//  DashboardVC.swift
//  MarsPlay
//
//  Created by ashok Mahawar on 10/01/20.
//  Copyright © 2020 ashok Mahawar. All rights reserved.
//

import UIKit

class DashboardVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
  
    

    @IBOutlet weak var listCollectionView: UICollectionView!
    private var totalres : Int = 0
    private var contentDataList : [ContentModel] = []
    var pageNo : Int = 1
    var response : String = "True"
    override func viewDidLoad() {
        super.viewDidLoad()
        getContentList(pageNo)
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

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contentDataList.count
      }
      
      func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row > contentDataList.count - 2 && response == "True"{
            pageNo = pageNo + 1
            getContentList(pageNo)
        }
        let cell : DashboardVCCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "DashboardVCCollectionCell", for: indexPath) as! DashboardVCCollectionCell
        cell.titleWidth.constant = (collectionView.frame.size.width - 10)/2
        cell.layoutIfNeeded()
        cell.titleLbl.text = "Title :" +  contentDataList[indexPath.row].title!
        cell.posterimageView.image = nil
        cell.posterimageView.imageLoad(contentDataList[indexPath.row].poster ?? "")
       // cell.imageLoad(contentDataList[indexPath.row].poster!, imageView: cell.posterimageView)
        cell.typeLbl.text = "Type : " + contentDataList[indexPath.row].type!
        cell.yearLbl.text = "\(2019 - (Int.init(contentDataList[indexPath.row].year ?? "") ?? 2019)) years ago"
        return cell
      }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard : UIStoryboard = UIStoryboard.init(name: "Main", bundle: Bundle.init(for: ViewController.self))
               let vc : DeatilsViewVC = storyboard.instantiateViewController(withIdentifier: "DeatilsViewVC") as! DeatilsViewVC
        vc.content = contentDataList[indexPath.row]
               self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width - 10
        
        return CGSize.init(width: width/2, height: 200)
    }
    
    func getContentList(_ page : Int) {
        WebAPIManager.perFormRequest(WSConetentList.init(page)) { (response, error, errorCode) in
            if error == nil {
                let data = try? JSONSerialization.data(withJSONObject: response as Any, options: [])
                let contentObj  = try? JSONDecoder().decode(ContentResult.self,from: data!)
                if let dataObj = contentObj {
                    for obj in (dataObj.Search)  {
                     self.contentDataList.append(obj)
                 }
                 self.totalres = Int.init(contentObj?.totalResults ?? "0") ?? 0
                    self.response = contentObj?.Response ?? "True"
                 self.listCollectionView.reloadData()
                }
            }
        }
    }
}
