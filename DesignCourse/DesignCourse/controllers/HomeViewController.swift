//
//  HomeViewController.swift
//  DesignCourse
//
//  Created by lotusprize on 15/9/28.
//  Copyright © 2015年 geekTeam. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var menuTableView: UITableView!
    
    @IBOutlet weak var menuPanel: UIView!
    @IBOutlet weak var contentPanel: UIView!
    @IBOutlet weak var contentScrollView: UIScrollView!
    
    lazy var menuItems: NSArray = {
        let path = NSBundle.mainBundle().pathForResource("MenuItems", ofType: "plist")
        return NSArray(contentsOfFile: path!)!
        }()
    
    var menuOpenFlag:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        menuTableView.dataSource = self
        menuTableView.delegate = self
        
        let view = UIView()
        view.backgroundColor = UIColor.clearColor()
        menuTableView.tableFooterView = view
        menuTableView.backgroundColor = menuPanel.backgroundColor
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MenuItemCell") as! MenuItemCell
        let menuItem = menuItems[indexPath.row] as! NSDictionary
        cell.configureForMenuItem(menuItem)
        cell.backgroundColor = menuPanel.backgroundColor
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.menuSpringAnimation(contentPanel)
    }
    
    @IBAction func menuBtnClick(sender: AnyObject) {
        
        //self.menuAnimation(contentPanel);
        self.menuSpringAnimation(contentPanel)
    }
    
    func menuAnimation(view:UIView){
        
        let anim:POPBasicAnimation = POPBasicAnimation.init(propertyNamed: kPOPLayerPosition)
        view.pop_removeAllAnimations();
        anim.fromValue = NSValue(CGPoint:CGPointMake(view.center.x, view.center.y))
        if (menuOpenFlag){
            anim.toValue =  NSValue(CGPoint:CGPointMake(view.center.x - 220, view.center.y))
        }
        else{
            anim.toValue =  NSValue(CGPoint:CGPointMake(view.center.x + 220, view.center.y))
        }
        
        anim.completionBlock = {(animation, finished) in
            if (finished){
                if (self.menuOpenFlag){
                    self.menuOpenFlag = false
                }
                else{
                    self.menuOpenFlag = true
                }
            }
        }
        contentPanel.layer.pop_addAnimation(anim, forKey: "Animation")
    }
    
    func menuSpringAnimation(view:UIView){
        
        view.pop_removeAllAnimations();
        let anim:POPSpringAnimation = POPSpringAnimation.init(propertyNamed:kPOPLayerPosition)
        anim.springBounciness = 10
        anim.springSpeed = 20
        
        if (menuOpenFlag){
            anim.toValue =  NSValue(CGPoint:CGPointMake(view.center.x - 220, view.center.y))
        }
        else{
            anim.toValue =  NSValue(CGPoint:CGPointMake(view.center.x + 220, view.center.y))
        }
        
        anim.completionBlock = {(animation, finished) in
            if (finished){
                if (self.menuOpenFlag){
                    self.menuOpenFlag = false
                }
                else{
                    self.menuOpenFlag = true
                }
            }
        }
        contentPanel.layer.pop_addAnimation(anim, forKey: "Animation")
    }
}
