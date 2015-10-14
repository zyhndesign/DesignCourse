//
//  TopicsDetailViewController.swift
//  DesignCourse
//
//  Created by lotusprize on 15/10/14.
//  Copyright © 2015年 geekTeam. All rights reserved.
//

import UIKit

class TopicsDetailViewController: UIViewController {
    
    var backBtn:BackButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.clearColor()
        let maskLayer:CALayer = CALayer()
        maskLayer.frame = CGRectMake(0, 0, 72, 708)
        maskLayer.opacity = 0.8
        maskLayer.backgroundColor = UIColor.grayColor().CGColor
        self.view.layer.addSublayer(maskLayer)
        
        backBtn = BackButton(frame:CGRectMake(22, 0, 50, 50))
        backBtn.addTarget(self, action: "backBtnClick", forControlEvents: UIControlEvents.TouchUpInside)
        backBtn.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(backBtn)
    }
    
    func backBtnClick(){
        self.view.pop_removeAllAnimations();
        let anim:POPSpringAnimation = POPSpringAnimation.init(propertyNamed:kPOPLayerPosition)
        anim.springBounciness = 1
        anim.springSpeed = 20
        anim.toValue =  NSValue(CGPoint:CGPointMake(1024 + 512, view.center.y))
        self.view.layer.pop_addAnimation(anim, forKey: "Animation")

    }
}
