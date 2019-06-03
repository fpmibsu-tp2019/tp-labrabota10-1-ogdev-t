//
//  MenuCollectionViewCell.swift
//  checkITin
//
//  Created by fpmi on 6/3/19.
//  Copyright © 2019 artloko. All rights reserved.
//

import UIKit


//класс того, что находится в ячейке нашего CollectionView

class MenuCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionCell: UILabel!
    @IBOutlet weak var btInvisible: UIButton!
    
    var menu: Menu? {
        didSet{
            descriptionCell.text = menu?.myDescription
            if let image = menu?.imageName {
                imageView.image = UIImage (named: image)
            }
            self.backgroundColor = UIColor.white
            self.layer.cornerRadius = 24
            self.layer.borderWidth = 1
            
            btInvisible.layer.borderWidth = 1
            btInvisible.layer.cornerRadius = 23
            
        }
    }
    var isPressed = 1
    
    @IBAction func btInvisiblePress(_ sender: Any) {
        if isPressed == 1
        {
            btInvisible.setImage(nil, for:UIControl.State.normal)
            isPressed = 0
        }
        else {
            let image = UIImage(named: "galochka")!
            btInvisible.setImage(image, for:UIControl.State.normal)
            isPressed = 1
        }
        
    }
    
}
