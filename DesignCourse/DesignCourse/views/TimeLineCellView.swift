//
//  TimeLineCellView.swift
//  DesignCourse
//
//  Created by lotusprize on 15/10/13.
//  Copyright © 2015年 geekTeam. All rights reserved.
//

import UIKit
import Haneke

class TimeLineCellView: UIView {
    
    var timeLineModel:TimelineModel!
    let cache = Shared.imageCache
    let fontColor = UIColor(red: 42/255.0, green: 58/255.0, blue: 97/255.0, alpha: 1)
    let lineColor = UIColor(red: 219/255.0, green: 219/255.0, blue: 221/255.0, alpha: 1)
    
    init() {
        print("init topics table view cell...")
        super.init(frame:CGRect.zero)
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    func initModel(timeLineModel:TimelineModel){
        self.timeLineModel = timeLineModel
    }
    
    override func drawRect(rect: CGRect) {
        let thumbLayer:CALayer = CALayer()
        thumbLayer.frame = CGRectMake(0, 0, 238, 238)
        if let imageUrl = timeLineModel.thumbImage{
            let URL = NSURL(string: imageUrl)!
            let fetcher = NetworkFetcher<UIImage>(URL: URL)
            cache.fetch(fetcher: fetcher).onSuccess { image in
                thumbLayer.contents = image.CGImage
            }
        }
        
        self.layer.addSublayer(thumbLayer)
        
        let titleLayer:CATextLayer = CATextLayer()
        titleLayer.fontSize = 16.0
        titleLayer.frame = CGRectMake(10, 251, 200, 18)
        titleLayer.foregroundColor = fontColor.CGColor
        titleLayer.string = timeLineModel.title
        self.layer.addSublayer(titleLayer)
        
        let lineLayer:CALayer = CALayer()
        lineLayer.frame = CGRectMake(10, 278, 218, 2)
        lineLayer.backgroundColor = lineColor.CGColor
        self.layer.addSublayer(lineLayer)
        
        let icon1:CALayer = CALayer()
        icon1.frame = CGRectMake(10, 286, 10, 10)
        icon1.contents = UIImage(named: "timeIcon")?.CGImage
        self.layer.addSublayer(icon1)
        
        let text1:CATextLayer = CATextLayer()
        text1.frame = CGRectMake(35, 285, 100, 12)
        text1.foregroundColor = fontColor.CGColor
        text1.string = timeLineModel.time
        text1.fontSize = 11.0
        self.layer.addSublayer(text1)
        
        let icon2:CALayer = CALayer()
        icon2.frame = CGRectMake(129, 286, 10, 10)
        icon2.contents = UIImage(named: "genreIcon")?.CGImage
        self.layer.addSublayer(icon2)
        
        let text2:CATextLayer = CATextLayer()
        text2.frame = CGRectMake(145, 285, 100, 12)
        text2.foregroundColor = fontColor.CGColor
        text2.string = timeLineModel.type
        text2.fontSize = 11.0
        self.layer.addSublayer(text2)
        
        let icon3:CALayer = CALayer()
        icon3.frame = CGRectMake(10, 306, 10, 10)
        icon3.contents = UIImage(named: "locationIcon")?.CGImage
        self.layer.addSublayer(icon3)
        
        let text3:CATextLayer = CATextLayer()
        text3.frame = CGRectMake(35, 305, 100, 12)
        text3.foregroundColor = fontColor.CGColor
        text3.string = timeLineModel.country
        text3.fontSize = 11.0
        self.layer.addSublayer(text3)
        
        
        let icon4:CALayer = CALayer()
        icon4.frame = CGRectMake(129, 306, 10, 10)
        icon4.contents = UIImage(named: "companyIcon")?.CGImage
        self.layer.addSublayer(icon4)
        
        let text4:CATextLayer = CATextLayer()
        text4.frame = CGRectMake(145, 305, 100, 12)
        text4.foregroundColor = fontColor.CGColor
        text4.string = timeLineModel.company
        text4.fontSize = 11.0
        self.layer.addSublayer(text4)
        
        let icon5:CALayer = CALayer()
        icon5.frame = CGRectMake(10, 326, 10, 10)
        icon5.contents = UIImage(named: "peopleIcon")?.CGImage
        self.layer.addSublayer(icon5)
        
        let text5:CATextLayer = CATextLayer()
        text5.frame = CGRectMake(35, 325, 100, 12)
        text5.foregroundColor = fontColor.CGColor
        text5.string = timeLineModel.time
        text5.fontSize = 11.0
        self.layer.addSublayer(text5)
    }
    
}

