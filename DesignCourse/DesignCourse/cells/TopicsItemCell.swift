//
//  TopicsItemCell.swift
//  DesignCourse
//
//  Created by lotusprize on 15/10/10.
//  Copyright © 2015年 geekTeam. All rights reserved.
//

import UIKit

class TopicsItemCell: UITableViewCell {
    
    @IBOutlet var topicsItemCell: TopicsTableViewCell!
    
    func loadItem(topicsModel:TopicsModel){
        topicsItemCell.initTopicsModel(topicsModel)
        topicsItemCell.setNeedsDisplay()
    }
    
}
