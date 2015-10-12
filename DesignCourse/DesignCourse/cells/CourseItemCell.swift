//
//  CourseItemCell.swift
//  DesignCourse
//
//  Created by lotusprize on 15/10/12.
//  Copyright © 2015年 geekTeam. All rights reserved.
//

import UIKit

class CourseItemCell: UICollectionViewCell {
    
    @IBOutlet weak var courseViewCell: CourseViewCell!
    
    func loadItem(courseModel:CourseModel){
        courseViewCell.initTopicsModel(courseModel)
        courseViewCell.setNeedsDisplay()
    }
    
}
