//
//  DescriptionViewController.swift
//  checkITin
//
//  Created by artloko on 6/1/19.
//  Copyright © 2019 artloko. All rights reserved.
//

import UIKit

class DescriptionViewController: ViewController {
    
    var menu: SightStruct?
    
    @IBOutlet weak var sightName: UILabel! {
        didSet {
            sightName.text = menu?.name
        }
    }
    
    @IBOutlet weak var sightDescription: UILabel! {
        didSet {
            sightDescription.text = menu?.sightDescription
        }
    }
    
    @IBOutlet weak var longitudeLabel: UILabel! {
        didSet {
            longitudeLabel.text = "Latitude: \(menu!.coordinate.latitude)"
        }
    }
    
    @IBOutlet weak var latitudeLabel: UILabel! {
        didSet {
            latitudeLabel.text = "Longitude: \(menu!.coordinate.longitude)"
        }
    }
    
    @IBOutlet weak var sightPhoto: UIImageView! {
        didSet {
            guard let image = menu?.imageName else {return}
            sightPhoto.image = UIImage(named: image)
            sightPhoto.layer.cornerRadius = 25
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tappedMap(_ sender: Any) {
        self.performSegue(withIdentifier: "goForAMap", sender: nil)
    }
}
