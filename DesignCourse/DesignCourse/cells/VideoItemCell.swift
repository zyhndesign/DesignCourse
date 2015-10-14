//
//  VideoItemCell.swift
//  DesignCourse
//
//  Created by lotusprize on 15/10/13.
//  Copyright © 2015年 geekTeam. All rights reserved.
//

import UIKit

class VideoItemCell: UICollectionViewCell {
    
    @IBOutlet weak var videoViewCell: VideoViewCell!
    
    func loadItem(videoModel:VideoModel){
        videoViewCell.initTopicsModel(videoModel)
        videoViewCell.setNeedsDisplay()
    }
    
}
