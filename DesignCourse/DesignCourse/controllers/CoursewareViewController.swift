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
}
