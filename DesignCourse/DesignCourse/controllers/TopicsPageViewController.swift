//
//  TopicsPageViewController.swift
//  DesignCourse
//
//  Created by lotusprize on 15/10/9.
//  Copyright © 2015年 geekTeam. All rights reserved.
//

import UIKit

class TopicsPageViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var searchBtn: SearchButton!
    @IBOutlet weak var tableView: UITableView!
    
    var topicsModel:TopicsModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "TopicsTableViewCell", bundle: nil)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.registerNib(nib, forCellReuseIdentifier: "customCell")
        
        topicsModel = TopicsModel()
        topicsModel.timeTextValue = "2015-01-01"
        topicsModel.titleTextValue = "Swift与Cocoa框架开发"
        topicsModel.authorTextValue = "Jonathon Manning"
        topicsModel.abstractTextValue = "Swift Developer with Cocoa Developing for the Mac and ios app stores,Swift Developer with Cocoa Developing for the Mac and ios app stores,Swift Developer with Cocoa Developing for the Mac and ios app stores,Swift Developer with Cocoa Developing for the Mac and ios app stores,Swift Developer with Cocoa Developing for the Mac and ios app stores,Swift Developer with Cocoa Developing for the Mac and ios app stores,Swift Developer with Cocoa Developing for the Mac and ios app stores"
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 386
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:TopicsItemCell = tableView.dequeueReusableCellWithIdentifier("customCell") as! TopicsItemCell
        
        cell.loadItem(topicsModel)
        
        return cell
        
    }
    
    @IBAction func SearchBtnClick(sender: AnyObject) {
        
    }
}
