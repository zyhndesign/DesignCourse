//
//  TimeLineViewController.swift
//  DesignCourse
//
//  Created by lotusprize on 15/10/12.
//  Copyright © 2015年 geekTeam. All rights reserved.
//

import UIKit

class TimeLineViewController: UIViewController,UIScrollViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate {
    
    @IBOutlet weak var timeLineScrollView: UIScrollView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let timeLong:Int = 500
    
    var timelineModel:TimelineModel!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeLineScrollView.delegate = self
        
        let timeLineView:TimeLineView = TimeLineView.init(frame: CGRectMake(0, 0, CGFloat(timeLong*10), 135.0),timeLong: timeLong)
        
        timeLineView.backgroundColor = UIColor.whiteColor()
        self.timeLineScrollView.contentSize = CGSizeMake(CGFloat(timeLong*10), 135)
        self.timeLineScrollView.addSubview(timeLineView)
        
        let nib = UINib(nibName: "TimeLineItemCell", bundle: nil)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.registerNib(nib, forCellWithReuseIdentifier: "customCell")
        
        timelineModel = TimelineModel()
        timelineModel.thumbImage = "http://design-pinwall.qiniudn.com/3784/1422329666573-400x400.jpg"
        timelineModel.time = "1809"
        timelineModel.country = "瑞典"
        timelineModel.company = "IKEA"
        timelineModel.type = "现代主义"
        timelineModel.title = "宜家家居"
        
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        //print(scrollView.contentOffset.x)
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        print(scrollView.contentOffset.x)
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1000
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell:TimeLineCell = collectionView.dequeueReusableCellWithReuseIdentifier("customCell", forIndexPath: indexPath)as! TimeLineCell
        
        cell.loadItem(timelineModel)
        cell.backgroundColor = UIColor(red: 242/255.0, green: 242/255.0, blue: 242/255.0, alpha: 1)
        
        return cell
    }
}
