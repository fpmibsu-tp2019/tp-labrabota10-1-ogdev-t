//
//  MenuCollectionViewCell.swift
//  checkITin
//
//  Created by fpmi on 6/3/19.
//  Copyright © 2019 artloko. All rights reserved.
//

import UIKit


//класс того, что находится в ячейке нашего CollectionView

@IBDesignable class MenuCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionCell: UILabel!
    @IBOutlet weak var btInvisible: UIButton!
    
    var menu: SightStruct? {
        didSet{
            descriptionCell.text = menu?.sightShortDescription
            if let image = menu?.imageName {
                imageView.image = UIImage (named: image)
            }
            
            self.backgroundColor = UIColor.white
            self.layer.cornerRadius = 25
            self.layer.borderWidth = 1
            
            btInvisible.layer.borderWidth = 1
            btInvisible.layer.cornerRadius = 25
            
            if menu!.visited {
                let image = UIImage(named: "galochka")!
                btInvisible.setImage(image, for:UIControl.State.normal)
            }
            else {
                btInvisible.setImage(nil, for:UIControl.State.normal)
            }
        }
    }
    
    @IBAction func btInvisiblePress(_ sender: Any) {
        if menu!.visited {
            let image = UIImage(named: "galochka")!
            btInvisible.setImage(image, for:UIControl.State.normal)
            menu!.visited = false
            SetupDB.setVisited(sightName: (menu?.name)!, isTrue: false)
        }
        else {
            btInvisible.setImage(nil, for:UIControl.State.normal)
            menu!.visited = true
            SetupDB.setVisited(sightName: (menu?.name)!, isTrue: true)
        }
        
    }
    
}
