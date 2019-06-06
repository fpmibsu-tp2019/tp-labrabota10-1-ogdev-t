//
//  AchieventViewController.swift
//  checkITin
//
//  Created by artloko on 6/1/19.
//  Copyright © 2019 artloko. All rights reserved.
//

import UIKit
import CoreData


class AchieventViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
   
    var sightsArray : [SightStruct] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        //SetupDB.deleteData()
        SetupDB.setup()
        sightsArray = SetupDB.getData()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDesc" {
            if let desc = segue.destination as? DescriptionViewController {
                let menu = sender as? SightStruct
                desc.menu = menu
            }
        }
    }
    
    @IBAction func tappedMapButton(_ sender: Any) {
        self.performSegue(withIdentifier: "goForAMap", sender: nil)
    }
    
}

extension AchieventViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as? MenuCollectionViewCell {
            itemCell.menu = sightsArray[indexPath.row]
            return itemCell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sightsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let menu = sightsArray[indexPath.row]
        self.performSegue(withIdentifier: "showDesc", sender: menu)
    }
}
