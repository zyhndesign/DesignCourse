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
    
    let searchPanel:UIView = UIView(frame: CGRectMake(220, -60, 584, 60))
    var searchPanelAppear:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "TopicsTableViewCell", bundle: nil)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.registerNib(nib, forCellReuseIdentifier: "customCell")
        
        
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
        
        
        
        topicsModel = TopicsModel()
        topicsModel.timeTextValue = "2015-01-01"
        topicsModel.titleTextValue = "Swift与Cocoa框架开发"
        topicsModel.authorTextValue = "Jonathon Manning"
        topicsModel.abstractTextValue = "Swift Developer with Cocoa Developing for the Mac and ios app stores,Swift Developer with Cocoa Developing for the Mac and ios app stores,Swift Developer with Cocoa Developing for the Mac and ios app stores,Swift Developer with Cocoa Developing for the Mac and ios app stores,Swift Developer with Cocoa Developing for the Mac and ios app stores,Swift Developer with Cocoa Developing for the Mac and ios app stores,Swift Developer with Cocoa Developing for the Mac and ios app stores,Swift Developer with Cocoa Developing for the Mac and ios app stores,Swift Developer with Cocoa Developing for the Mac and ios app stores,Swift Developer with Cocoa Developing for the Mac and ios app stores,Swift Developer with Cocoa Developing for the Mac and ios app stores"
        
        topicsModel.shareTextValue = "10"
        topicsModel.image1Url = "http://design-pinwall.qiniudn.com/3780/12925757732265-400x400.jpg"
        topicsModel.image2Url = "http://design-pinwall.qiniudn.com/3795/5744678437928-400x400.png"
        topicsModel.image3Url = "http://design-pinwall.qiniudn.com/3681/2872227141108-400x400.jpg"
        topicsModel.image4Url = "http://design-pinwall.qiniudn.com/3766/8616663868824-400x400.jpg"
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 406
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:TopicsItemCell = tableView.dequeueReusableCellWithIdentifier("customCell") as! TopicsItemCell
        
        cell.loadItem(topicsModel)
        cell.backgroundColor = UIColor(red: 242/255.0, green: 242/255.0, blue: 242/255.0, alpha: 1)
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        return cell
        
    }
    
    @IBAction func SearchBtnClick(sender: AnyObject) {
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
