//
//  HomeItemView.swift
//  DesignCourse
//
//  Created by lotusprize on 15/10/8.
//  Copyright © 2015年 geekTeam. All rights reserved.
//

import UIKit
import Haneke

class HomeItemView: UIView {
    
    var imageUrl:String
    var title:String
    var time:String
    let cache = Shared.imageCache
    
    init(frame: CGRect,imageUrl:String, title:String, time:String) {
        self.imageUrl = imageUrl
        self.title = title
        self.time = time
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect) {
        let imageLayer:CALayer = CALayer.init()
        imageLayer.frame = CGRectMake(0, 0, 188, 106)
        imageLayer.contentsGravity = kCAGravityResize
        let URL = NSURL(string: imageUrl)!
        let fetcher = NetworkFetcher<UIImage>(URL: URL)
        cache.fetch(fetcher: fetcher).onSuccess { image in
            imageLayer.contents = image.CGImage
        }
        self.layer.addSublayer(imageLayer)
        
        let titleLayer:CATextLayer = CATextLayer.init()
        titleLayer.frame = CGRectMake(5, 106, 180, 25)
        titleLayer.string = title
        titleLayer.foregroundColor = UIColor(red: 42/255.0, green: 58/255.0, blue: 97/255.0, alpha: 1).CGColor
        titleLayer.fontSize = 20.0
        
        self.layer.addSublayer(titleLayer)
        
        let timeLayer:CATextLayer = CATextLayer.init()
        timeLayer.frame = CGRectMake(5, 136, 180, 16)
        timeLayer.string = time
        timeLayer.fontSize = 14.0
        timeLayer.foregroundColor = UIColor(red: 247/255.0, green: 182/255.0, blue: 0, alpha: 1).CGColor
        self.layer.addSublayer(timeLayer)
        
    }
}
