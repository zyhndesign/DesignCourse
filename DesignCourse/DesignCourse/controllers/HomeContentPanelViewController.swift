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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topicsView1 = HomeTopicsView.init(frame: CGRectMake(30, 48, 386, 220), imageUrl: "", title: "", time: "")
        topicsView2 = HomeTopicsView.init(frame: CGRectMake(426, 48, 386, 220), imageUrl: "", title: "", time: "")
        toolsView1 = HomeTopicsView.init(frame: CGRectMake(822, 48, 190, 105), imageUrl: "", title: "", time: "")
        toolsView2 = HomeTopicsView.init(frame: CGRectMake(822, 161, 190, 105), imageUrl: "", title: "", time: "")
        
        self.view.addSubview(topicsView1)
        self.view.addSubview(topicsView2)
        self.view.addSubview(toolsView1)
        self.view.addSubview(toolsView2)
        
        for  i  in 0...4{
            let homeItemView:HomeItemView = HomeItemView.init(frame: CGRectMake(CGFloat(Float(30+(i * 198))), 316, 188, 160), imageUrl: "", title: "", time: "")
            self.view.addSubview(homeItemView)
        }
        
        for  i  in 0...4{
            let homeItemView:HomeItemView = HomeItemView.init(frame: CGRectMake(CGFloat(Float(30 + i * 198)), 526, 188, 160), imageUrl: "", title: "", time: "")
            self.view.addSubview(homeItemView)
        }
    }
    
}
