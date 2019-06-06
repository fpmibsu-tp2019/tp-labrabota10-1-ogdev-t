//
//  ViewController.swift
//  checkITin
//
//  Created by artloko on 5/31/19.
//  Copyright © 2019 artloko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var logoImage: UIImageView!
    
    @IBOutlet weak var btStart: CustomButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let  cBT: customButton;
        // Do any additional setup after loading the view, typically from a nib.
        //btStart.layer.cornerRadius = 24;
        
    }

    @IBAction func tappedStartButton(_ sender: Any) {
        self.performSegue(withIdentifier: "achieveSeque", sender: nil)
    }
}

