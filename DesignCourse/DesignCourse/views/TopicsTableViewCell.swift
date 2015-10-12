//
//  TopicsTableViewCell.swift
//  DesignCourse
//
//  Created by lotusprize on 15/10/10.
//  Copyright © 2015年 geekTeam. All rights reserved.
//

import UIKit
import Haneke

class TopicsTableViewCell: UIView {
    
    var timeTextLayer:CATextLayer!
    var titleTextLayer:CATextLayer!
    var authorTextLayer:CATextLayer!
    var abstractTextLayer:CATextLayer!
    var imageLayer1:CALayer!
    var imageLayer2:CALayer!
    var imageLayer3:CALayer!
    var imageLayer4:CALayer!
    var iconLayer:CALayer!
    var shareTextLayer:CATextLayer!
    
    var topicsModel:TopicsModel!
    let cache = Shared.imageCache
    
    init() {
        print("init topics table view cell...")
        super.init(frame:CGRect.zero)
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func initTopicsModel(topicsModel:TopicsModel){
        self.topicsModel = topicsModel
        
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override func drawRect(rect: CGRect) {
        let retinaScreen:Bool = (UIScreen.mainScreen().currentMode?.size.width == 768)
        print(retinaScreen)
        timeTextLayer = CATextLayer()
        
        timeTextLayer.frame = CGRectMake(20.0, 20.0, 200, 15)
        timeTextLayer.fontSize = 14.0
        
        timeTextLayer.foregroundColor = UIColor(red: 42.0/255.0, green: 58.0/255.0, blue: 97.0/255.0, alpha: 1.0).CGColor
        self.layer.addSublayer(timeTextLayer)
        
        titleTextLayer = CATextLayer()
        titleTextLayer.frame = CGRectMake(20.0, 49.0, 520, 36)
        titleTextLayer.fontSize = 30.0
        titleTextLayer.foregroundColor = UIColor(red: 42.0/255.0, green: 58.0/255.0, blue: 97.0/255.0, alpha: 1.0).CGColor
        self.layer.addSublayer(titleTextLayer)
        
        authorTextLayer = CATextLayer()
        authorTextLayer.frame = CGRectMake(20.0, 92.0, 520, 36)
        authorTextLayer.fontSize = 18.0
        authorTextLayer.foregroundColor = UIColor(red: 247/255.0, green: 182/255.0, blue: 0, alpha: 1.0).CGColor
        self.layer.addSublayer(authorTextLayer)
        
        abstractTextLayer = CATextLayer()
        abstractTextLayer.frame = CGRectMake(20, 128, 520, 193)
        abstractTextLayer.fontSize = 14.0
        abstractTextLayer.alignmentMode = kCAAlignmentLeft
        abstractTextLayer.foregroundColor = UIColor(red: 122/255.0, green: 124/255.0, blue: 127/255.0, alpha: 1.0).CGColor
        
        if (retinaScreen)
        {
            timeTextLayer.contentsScale = 1.0
            titleTextLayer.contentsScale = 1.0
            authorTextLayer.contentsScale = 1.0
            abstractTextLayer.contentsScale = 1.0
        }
        else
        {
            timeTextLayer.contentsScale = 2.0
            titleTextLayer.contentsScale = 2.0
            authorTextLayer.contentsScale = 2.0
            abstractTextLayer.contentsScale = 2.0
        }
        
        abstractTextLayer.wrapped = true
        self.layer.addSublayer(abstractTextLayer)
        
        imageLayer1 = CALayer()
        imageLayer1.frame = CGRectMake(594, 0, 193, 193)
        self.layer.addSublayer(imageLayer1)
        
        imageLayer2 = CALayer()
        imageLayer2.frame = CGRectMake(797, 0, 193, 193)
        self.layer.addSublayer(imageLayer2)
        
        imageLayer3 = CALayer()
        imageLayer3.frame = CGRectMake(594, 193, 193, 193)
        self.layer.addSublayer(imageLayer3)
        
        imageLayer4 = CALayer()
        imageLayer4.frame = CGRectMake(797, 193, 193, 193)
        self.layer.addSublayer(imageLayer4)
        
        iconLayer = CALayer()
        iconLayer.frame = CGRectMake(20, 340, 18, 15)
        iconLayer.contents = UIImage(named: "worksIcon")?.CGImage
        self.layer.addSublayer(iconLayer)
        
        shareTextLayer = CATextLayer()
        shareTextLayer.frame = CGRectMake(40, 340, 100, 15)
        shareTextLayer.fontSize = 14.0
        shareTextLayer.foregroundColor = UIColor(red: 122/255.0, green: 124/255.0, blue: 127/255.0, alpha: 1.0).CGColor
        self.layer.addSublayer(shareTextLayer)
        
        timeTextLayer.string = topicsModel.timeTextValue
        
        titleTextLayer.string = topicsModel.titleTextValue
        
        authorTextLayer.string = topicsModel.authorTextValue
        
        abstractTextLayer.string = topicsModel.abstractTextValue
        
        shareTextLayer.string = topicsModel.shareTextValue
        
        if let image1URL = topicsModel.image1Url{
            let imageURL = NSURL(string: image1URL)!
            let fetcher = NetworkFetcher<UIImage>(URL: imageURL)
            cache.fetch(fetcher: fetcher).onSuccess { image in
                self.imageLayer1.contents = image.CGImage
            }
        }
        
        if let image2URL = topicsModel.image2Url{
            let imageURL = NSURL(string: image2URL)!
            let fetcher = NetworkFetcher<UIImage>(URL: imageURL)
            cache.fetch(fetcher: fetcher).onSuccess { image in
                self.imageLayer2.contents = image.CGImage
            }
        }
        
        if let image3URL = topicsModel.image3Url{
            let imageURL = NSURL(string: image3URL)!
            let fetcher = NetworkFetcher<UIImage>(URL: imageURL)
            cache.fetch(fetcher: fetcher).onSuccess { image in
                self.imageLayer3.contents = image.CGImage
            }
        }
        
        if let image4URL = topicsModel.image4Url{
            let imageURL = NSURL(string: image4URL)!
            let fetcher = NetworkFetcher<UIImage>(URL: imageURL)
            cache.fetch(fetcher: fetcher).onSuccess { image in
                self.imageLayer4.contents = image.CGImage
            }
        }
    }
    
}
