//
//  TimeLineCell.swift
//  DesignCourse
//
//  Created by lotusprize on 15/10/13.
//  Copyright © 2015年 geekTeam. All rights reserved.
//

import UIKit

class TimeLineCell: UICollectionViewCell {
    
    @IBOutlet weak var timeLineCellView: TimeLineCellView!
    
    func loadItem(timelineModel:TimelineModel){
        timeLineCellView.initModel(timelineModel)
        timeLineCellView.setNeedsDisplay()
    }
    
}
