//
//  CourseViewCell.swift
//  DesignCourse
//
//  Created by lotusprize on 15/10/12.
//  Copyright © 2015年 geekTeam. All rights reserved.
//

//
//  CoourseViewCell.swift
//  DesignCourse
//
//  Created by lotusprize on 15/10/12.
//  Copyright © 2015年 geekTeam. All rights reserved.
//

import UIKit
import Haneke

class CourseViewCell: UIView {
    
    var courseModel:CourseModel!
    let cache = Shared.imageCache
    
    init() {
        print("init topics table view cell...")
        super.init(frame:CGRect.zero)
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func initTopicsModel(courseModel:CourseModel){
        self.courseModel = courseModel
        
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override func drawRect(rect: CGRect) {
        let imageLayer:CALayer = CALayer.init()
        imageLayer.frame = CGRectMake(0, 0, 188, 106)
        imageLayer.contentsGravity = kCAGravityResize
        if let imageUrl = courseModel.courseThumbImage{
            let URL = NSURL(string: imageUrl)!
            let fetcher = NetworkFetcher<UIImage>(URL: URL)
            cache.fetch(fetcher: fetcher).onSuccess { image in
                imageLayer.contents = image.CGImage
            }
        }
        
        self.layer.addSublayer(imageLayer)
        
        let titleLayer:CATextLayer = CATextLayer.init()
        titleLayer.frame = CGRectMake(5, 106, 180, 25)
        titleLayer.string = courseModel.courseName
        titleLayer.foregroundColor = UIColor(red: 42/255.0, green: 58/255.0, blue: 97/255.0, alpha: 1).CGColor
        titleLayer.fontSize = 20.0
        
        self.layer.addSublayer(titleLayer)
        
        let timeLayer:CATextLayer = CATextLayer.init()
        timeLayer.frame = CGRectMake(5, 136, 180, 16)
        timeLayer.string = courseModel.courseTime
        timeLayer.fontSize = 14.0
        timeLayer.foregroundColor = UIColor(red: 247/255.0, green: 182/255.0, blue: 0, alpha: 1).CGColor
        self.layer.addSublayer(timeLayer)
        
    }
}

