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
    
    let searchPanel:UIView = UIView(frame: CGRectMake(220, -60, 584, 60))
    var searchPanelAppear:Bool = false
    
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
        
        searchPanel.backgroundColor = UIColor.whiteColor()
        
        let iconLayer:CALayer = CALayer()
        iconLayer.contents = UIImage(named: "searchIcon")?.CGImage
        iconLayer.frame = CGRectMake(10, 20, 20, 20)
        searchPanel.layer.addSublayer(iconLayer)
        
        let searchText:UITextField = UITextField(frame: CGRectMake(40, 10, 484, 40))
        searchText.placeholder = "搜索......"
        searchPanel.addSubview(searchText)
        
        searchPanel.layer.borderWidth = 1;
        searchPanel.layer.borderColor = UIColor(red: 247/255.0, green: 182/255.0, blue: 0, alpha: 1).CGColor;
        
        self.view.addSubview(searchPanel)
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
    
    @IBAction func searchBtnClick(sender: AnyObject) {
        view.pop_removeAllAnimations();
        let anim:POPSpringAnimation = POPSpringAnimation.init(propertyNamed:kPOPLayerPosition)
        
        anim.springSpeed = 10
        
        if (searchPanelAppear){
            searchPanelAppear = false
            anim.springBounciness = 0
            anim.toValue =  NSValue(CGPoint:CGPointMake(searchPanel.center.x, searchPanel.center.y - 250))
        }
        else{
            anim.toValue =  NSValue(CGPoint:CGPointMake(searchPanel.center.x, searchPanel.center.y + 250))
            searchPanelAppear = true
            anim.springBounciness = 10
        }
        anim.completionBlock = {(animation, finished) in
            if (finished){
                
            }
        }
        searchPanel.layer.pop_addAnimation(anim, forKey: "Animation")
    }
}