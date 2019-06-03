//
//  customButton.swift
//  checkITin
//
//  Created by fpmi on 6/1/19.
//  Copyright © 2019 artloko. All rights reserved.
//

import UIKit

class customButton: UIButton {
    
    @IBAction func btStart(_ sender: UIButton) {
        //чисто для проверки, работает ли
        self.layer.cornerRadius = 50;
        self.setTitle("upBut", for: UIControl.State.normal);
        self.tintColor = UIColor.black;
    }
    
    /*
    // Only override draw() if you performв custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
