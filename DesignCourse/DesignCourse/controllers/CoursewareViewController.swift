//
//  CoursewareViewController.swift
//  DesignCourse
//
//  Created by lotusprize on 15/10/9.
//  Copyright © 2015年 geekTeam. All rights reserved.
//

import UIKit

class CoursewareViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var courseModel:CourseModel!
    
    let searchPanel:UIView = UIView(frame: CGRectMake(220, -60, 584, 60))
    var searchPanelAppear:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "CourseItemCell", bundle: nil)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.registerNib(nib, forCellWithReuseIdentifier: "customCell")
        
        courseModel = CourseModel()
        courseModel.courseThumbImage = "http://design-pinwall.qiniudn.com/4506/10029056595565-400x400.jpg"
        courseModel.courseName = "丹麦设计"
        courseModel.courseTime = "2015-10-09"
        
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
        let cell:CourseItemCell = collectionView.dequeueReusableCellWithReuseIdentifier("customCell", forIndexPath: indexPath)as! CourseItemCell

        cell.loadItem(courseModel)
        cell.backgroundColor = UIColor(red: 242/255.0, green: 242/255.0, blue: 242/255.0, alpha: 1)
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    @IBAction func searchBtnClick(sender: AnyObject) {
        print("click...")
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
