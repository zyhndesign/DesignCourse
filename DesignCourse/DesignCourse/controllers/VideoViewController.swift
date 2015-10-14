//
//  VideoViewController.swift
//  DesignCourse
//
//  Created by lotusprize on 15/10/9.
//  Copyright © 2015年 geekTeam. All rights reserved.
//

import UIKit

class VideoViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate  {
    
    @IBOutlet weak var videoCollectionView: UICollectionView!
    
    var videoModel:VideoModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "VideoItemCell", bundle: nil)
        
        videoCollectionView.delegate = self
        videoCollectionView.dataSource = self
        
        videoCollectionView.registerNib(nib, forCellWithReuseIdentifier: "customCell")
        
        videoModel = VideoModel()
        videoModel.videoThumbImage = "http://design-pinwall.qiniudn.com/3769/2845093034542-400x400.jpg"
        videoModel.videoName = "挑花设计"
        videoModel.videoTime = "2015-10-09"
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1000
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell:VideoItemCell = collectionView.dequeueReusableCellWithReuseIdentifier("customCell", forIndexPath: indexPath)as! VideoItemCell
        
        cell.loadItem(videoModel)
        cell.backgroundColor = UIColor(red: 242/255.0, green: 242/255.0, blue: 242/255.0, alpha: 1)
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
}