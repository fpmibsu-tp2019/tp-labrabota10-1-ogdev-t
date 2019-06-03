//
//  AchieventViewController.swift
//  checkITin
//
//  Created by artloko on 6/1/19.
//  Copyright © 2019 artloko. All rights reserved.
//

import UIKit

var itemMenuArray: [Menu] = {
    var blankMenu = Menu()
    blankMenu.myDescription = "Minsk Arena, known locally as the Botvinik Arena, is the main indoor arena in Minsk, Belarus."
    blankMenu.imageName = "arena"
    
    var blankMenu2 = Menu()
    blankMenu2.myDescription = "Church of Saints Simon and Helena also known as the Red Church is a Roman Catholic church..."
    blankMenu2.imageName = "kostel"
    
    return [blankMenu, blankMenu2]
}()

class AchieventViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDesc" {
            if let desc = segue.destination as? DescriptionViewController {
                let menu = sender as? Menu
                desc.menu = menu
                if desc.sightPhoto != nil
                {
                    desc.sightPhoto.layer.cornerRadius = 50
                }
            }
        }
    }

}

extension AchieventViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as? MenuCollectionViewCell {
            itemCell.menu = itemMenuArray[indexPath.row]
            return itemCell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemMenuArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let menu = itemMenuArray[indexPath.row]
        self.performSegue(withIdentifier: "showDesc", sender: menu)
    }
}
