//
//  TimeLineView.swift
//  DesignCourse
//
//  Created by lotusprize on 15/10/13.
//  Copyright © 2015年 geekTeam. All rights reserved.
//

import UIKit

class TimeLineView: UIView {
    
    var timeLong:Int;
    let startTime:Int = 1500;
    
    init(frame: CGRect,timeLong:Int) {
        self.timeLong = timeLong
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect) {
        
        let ctx:CGContextRef = UIGraphicsGetCurrentContext()!
        let color:UIColor = UIColor(red: 42/255.0, green: 58/255.0, blue: 97/255.0, alpha: 1)
        var timeText:Int = startTime
        for index in 1...timeLong{
            if (index % 10 == 0){
                CGContextMoveToPoint(ctx, CGFloat(index)*10.0, 63)
                CGContextAddLineToPoint(ctx, CGFloat(index)*10.0, 72)
                CGContextSetLineWidth(ctx, 3)
                CGContextStrokePath(ctx)
                
                let time:CATextLayer = CATextLayer()
                time.frame = CGRectMake(CGFloat(index)*10.0 - 20, 32, 40, 15)
                time.alignmentMode = kCAAlignmentCenter
                time.fontSize = 14.0
                time.foregroundColor = color.CGColor
                timeText = timeText + 10
                time.string = String(timeText)
                self.layer.addSublayer(time)
                
            }
            else{
                CGContextMoveToPoint(ctx, CGFloat(index)*10.0, 65)
                CGContextAddLineToPoint(ctx, CGFloat(index)*10.0, 70)
                CGContextSetLineWidth(ctx, 1)
                CGContextStrokePath(ctx)
            }
        }
        
        
        for index in 1...timeLong{
            if (index % 3 == 0){
                CGContextSetLineWidth(ctx, 2.0);
                CGContextSetStrokeColorWithColor(ctx, color.CGColor);
                let point:CGFloat = CGFloat(index)*10.0
                CGContextMoveToPoint(ctx, point, 88);
                CGContextAddLineToPoint(ctx, point + 2, 90);
                CGContextAddLineToPoint(ctx, point, 92);
                CGContextAddLineToPoint(ctx, point - 2, 90);
                CGContextAddLineToPoint(ctx, point, 88);
                CGContextStrokePath(ctx);
            }
        }
        
    }
    
}
