//
//  HomeContentPanelViewController.swift
//  DesignCourse
//
//  Created by lotusprize on 15/10/8.
//  Copyright © 2015年 geekTeam. All rights reserved.
//

import UIKit

class HomeContentPanelViewController: UIViewController {
    
    var topicsView1:HomeTopicsView!
    var topicsView2:HomeTopicsView!
    var toolsView1:HomeTopicsView!
    var toolsView2:HomeTopicsView!
    
    var topicsDetailViewController:TopicsDetailViewController!
    
    let loadingHubView:iKYLoadingHubView = iKYLoadingHubView.init(frame:CGRectMake((UIScreen.mainScreen().bounds.size.width - 150) / 2, (UIScreen.mainScreen().bounds.size.height - 150) / 2, 110, 110))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topicsView1 = HomeTopicsView.init(frame: CGRectMake(30, 48, 386, 220), imageUrl: "http://design-pinwall.qiniudn.com/4381/5730935390152-400x400.jpg", title: "设计溯源：探索进化的力量", time: "2015-06-14")
        let gesture:UIGestureRecognizer = UITapGestureRecognizer.init(target: self, action: "tappedView")
        topicsView1.userInteractionEnabled = true
        topicsView1.addGestureRecognizer(gesture)
        
        topicsView2 = HomeTopicsView.init(frame: CGRectMake(426, 48, 386, 220), imageUrl: "http://design-pinwall.qiniudn.com/4494/11462360433920-400x400.jpg", title: "设计比较", time: "2015-06-11")
        toolsView1 = HomeTopicsView.init(frame: CGRectMake(822, 48, 190, 105), imageUrl: "http://design-pinwall.qiniudn.com/4031/12895355896704-400x400.jpg", title: "时间线", time: "2015-06-16")
        toolsView2 = HomeTopicsView.init(frame: CGRectMake(822, 161, 190, 105), imageUrl: "http://design-pinwall.qiniudn.com/4528/4298376026259-400x400.jpg", title: "教材", time: "2015-06-1")
        
        self.view.addSubview(topicsView1)
        self.view.addSubview(topicsView2)
        self.view.addSubview(toolsView1)
        self.view.addSubview(toolsView2)
        
        for  i  in 0...4{
            let homeItemView:HomeItemView = HomeItemView.init(frame: CGRectMake(CGFloat(Float(30+(i * 198))), 316, 188, 160), imageUrl: "http://design-pinwall.qiniudn.com/4512/1432747511187-400x400.jpg", title: "文艺复兴", time: "2015-06-1")
            homeItemView.backgroundColor = UIColor.whiteColor()
            self.view.addSubview(homeItemView)
        }
        
        for  i  in 0...4{
            let homeItemView:HomeItemView = HomeItemView.init(frame: CGRectMake(CGFloat(Float(30 + i * 198)), 526, 188, 160), imageUrl: "http://design-pinwall.qiniudn.com/4325/5731127267488-400x400.jpg", title: "文艺复兴的建筑大师", time: "2015-06-1")
            homeItemView.backgroundColor = UIColor.whiteColor()
            self.view.addSubview(homeItemView)
        }
        
        self.view.addSubview(loadingHubView)
        loadingHubView.showHub()
        let time: NSTimeInterval = 2.0
        let delay = dispatch_time(DISPATCH_TIME_NOW,
            Int64(time * Double(NSEC_PER_SEC)))
        dispatch_after(delay, dispatch_get_main_queue()) {
            self.loadingHubView.dismissHub()
        }
        
    }
    
    func tappedView(){
        
        if (topicsDetailViewController == nil){
            topicsDetailViewController = TopicsDetailViewController(nibName:"TopicDetailView",bundle:NSBundle.mainBundle())
            topicsDetailViewController.view.frame = CGRectMake(1024, 60, 1024, 708)
            self.view.addSubview(topicsDetailViewController.view)
            self.addChildViewController(topicsDetailViewController)
        }
        
        topicsDetailViewController.view.pop_removeAllAnimations();
        let anim:POPSpringAnimation = POPSpringAnimation.init(propertyNamed:kPOPLayerPosition)
        anim.springBounciness = 5
        anim.springSpeed = 20
        anim.toValue =  NSValue(CGPoint:CGPointMake(512, view.center.y))
        
        topicsDetailViewController.view.layer.pop_addAnimation(anim, forKey: "Animation")
        
    }
    
}
