//
//  DescriptionViewController.swift
//  checkITin
//
//  Created by artloko on 6/1/19.
//  Copyright © 2019 artloko. All rights reserved.
//

import UIKit

class DescriptionViewController: ViewController {
    
    @IBOutlet weak var sightName: UILabel!
    @IBOutlet weak var sightDescription: UILabel!
    
    var descriptions: [SightStruct] = {
        var blankSight = SightStruct()
        blankSight.imageNameStruct = "arena"
        blankSight.sightDescriptionStruct = "Minsk Arena, known locally as the Botvinik Arena is the main indoor arena in Minsk, Belarus. Along the main arena, the Minsk-Arena complex includes four venues which are the arena itself (hosting 15,000 spectators), a cycling track (hosting 2,000 spectators), a skating stadium (3,000 spectators) and a multilevel parking structure."
        blankSight.sightNameStruct = "Minsk-Arena"
        
        var blankSight2 = SightStruct()
        blankSight2.imageNameStruct = "kostel"
        blankSight2.sightDescriptionStruct = "Very interesting description."
        blankSight2.sightNameStruct = "Church of Saints Simon and Helena"
        
        return [blankSight, blankSight2]
    }()
    
    @IBOutlet weak var sightPhoto: UIImageView!
    {
        didSet {
            guard let image = menu?.imageName else {return}
            sightPhoto.image = UIImage(named: image)
        }
    }
    
    var menu: Menu?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for desc in descriptions
        {
            if desc.imageNameStruct == menu?.imageName
            {
                sightName.text = desc.sightNameStruct
                sightDescription.text = desc.sightDescriptionStruct
            }
        }
        // Do any additional setup after loading the view.
    }
    
}
