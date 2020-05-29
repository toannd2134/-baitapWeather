//
//  ViewController.swift
//  weather
//
//  Created by Toan on 5/27/20.
//  Copyright © 2020 Toan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var hocolectionView: UICollectionView!
    var clound = [UIImage(named: "clound"),UIImage(named: "clound1"),UIImage(named: "clound1"),UIImage(named: "clound3"),UIImage(named: "clound"),UIImage(named: "clound"),UIImage(named: "clound"),UIImage(named: "clound"),UIImage(named: "clound")]
    var time = ["now","17","18" ,"18:32","19","20","21","22","22"]
    var  day  = ["wenesday","thursday","friday","Monday","Tusesday","wednesday","monday","thurday"]
    var doC =  ["29","28","sunset","28","29","28","23","22","33"]
    var hightestDoC = [32,33,34,35,36,38,39,33]
    var lowestDoC = [23,24,27,27,27,27,22,18]
    @IBOutlet weak var local: UILabel!
    @IBOutlet weak var DayInt: UILabel!
    @IBOutlet weak var Dayname: UILabel!
    @IBOutlet weak var colectionVertical: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        colectionVertical.delegate = self
        colectionVertical.dataSource = self
        hocolectionView.delegate = self
        hocolectionView.dataSource = self
        if let folowlayout = colectionVertical.collectionViewLayout as? UICollectionViewFlowLayout {
            folowlayout.scrollDirection = .horizontal
        }
        colectionVertical.showsHorizontalScrollIndicator = false
        hocolectionView.showsVerticalScrollIndicator = false
       
    }


}
extension ViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       if collectionView == colectionVertical {
        return CGSize(width: 70, height: 100)
       }else  {
        return CGSize(width: view.frame.width, height: 50)
       }
       
   }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView ==  colectionVertical {
            return time.count
        }else {
            return day.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if  collectionView == colectionVertical {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! VerticalCollectionViewCell
            cell.time.text = time[indexPath.row]
            cell.cloundImg.image = clound[indexPath.row]
            cell.DoC.text = doC[indexPath.row]
            return cell
        }else if collectionView == hocolectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! HonCollectionViewCell
            cell.day.text = day[indexPath.row]
            cell.CloundImg.image = clound[indexPath.row]
            cell.hightestDoc.text = String(hightestDoC[indexPath.row])
            cell.lowestDoC.text = String(lowestDoC[indexPath.row])
            
            
            return cell
        }else {
            let cell = UICollectionViewCell()
            return cell
        }
    }
    
    
}

