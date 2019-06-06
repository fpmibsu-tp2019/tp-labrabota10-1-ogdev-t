//
//  customButton.swift
//  checkITin
//
//  Created by fpmi on 6/1/19.
//  Copyright © 2019 artloko. All rights reserved.
//

import UIKit

@IBDesignable class CustomButton: UIButton {
    
    override init(frame: CGRect){
        super.init(frame: frame)
        sharedInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }
    
    override func prepareForInterfaceBuilder() {
        sharedInit()
    }
    
    func sharedInit() {
        refreshCorners(value: cornerRadius)
    }
    
    func refreshCorners(value: CGFloat){
        layer.cornerRadius = value
        layer.masksToBounds = value > 0
    }
    
    @IBInspectable var cornerRadius : CGFloat = 0 {
        didSet{
            refreshCorners(value: cornerRadius)
        }
    }
    // Only override draw() if you performв custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
    }
 

}
