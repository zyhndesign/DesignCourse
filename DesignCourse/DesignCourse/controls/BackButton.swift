//
//  BackButton.swift
//  DesignCourse
//
//  Created by lotusprize on 15/10/14.
//  Copyright © 2015年 geekTeam. All rights reserved.
//

import UIKit

class BackButton: UIButton {
    
    override func drawRect(rect: CGRect) {
        /*
        self.layer.shadowColor = UIColor.blackColor().CGColor
        self.layer.shadowOffset = CGSizeMake(3, 3)
        self.layer.shadowRadius = 1.0
        self.layer.shadowOpacity = 0.4
        */
        //let circlePath:CGMutablePathRef = CGPathCreateMutable()
        //CGPathAddEllipseInRect(circlePath, nil, self.bounds)
        //self.layer.shadowPath = circlePath
        
        let searchIconLayer:CALayer = CALayer()
        searchIconLayer.frame = CGRectMake(11, 11, 24, 24)
        searchIconLayer.contents = UIImage(named: "rightArrow")?.CGImage
        self.layer.addSublayer(searchIconLayer)
        
        
    }
}
