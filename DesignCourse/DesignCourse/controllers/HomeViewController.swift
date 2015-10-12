//
//  HomeViewController.swift
//  DesignCourse
//
//  Created by lotusprize on 15/9/28.
//  Copyright © 2015年 geekTeam. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate {
    
    
    @IBOutlet weak var homeBtn: UIButton!
    @IBOutlet weak var topicsBtn: UIButton!
    @IBOutlet weak var courseBtn: UIButton!
    @IBOutlet weak var videoBtn: UIButton!
    @IBOutlet weak var teachingMaterialBtn: UIButton!
    @IBOutlet weak var timeLineBtn: UIButton!
    
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var menuTableView: UITableView!
    
    @IBOutlet weak var menuPanel: UIView!
    @IBOutlet weak var contentPanel: UIView!
    @IBOutlet weak var contentScrollView: UIScrollView!
    
    var homeViewController:UIViewController!;
    var topicsPageViewController:UIViewController!;
    var coursewareViewController:UIViewController!;
    var videoViewController:UIViewController!;
    var teachingMaterialViewController:UIViewController!;
    var timeLineViewController:UIViewController;
    
    let color:UIColor = UIColor(red: 19/255.0, green: 31/255.0, blue: 54/255.0, alpha: 1)
    
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
        
        contentScrollView.delegate = self
        
        let view = UIView()
        view.backgroundColor = UIColor.clearColor()
        menuTableView.tableFooterView = view
        menuTableView.backgroundColor = menuPanel.backgroundColor
        
        homeViewController = HomeContentPanelViewController(nibName:"HomePageView",bundle:NSBundle.mainBundle())
        homeViewController.view.frame = CGRectMake(0, 0, 1024, 708)
        contentScrollView.addSubview(homeViewController.view)
        self.addChildViewController(homeViewController)
        
        topicsPageViewController = TopicsPageViewController(nibName:"TopicsPageView",bundle:NSBundle.mainBundle())
        topicsPageViewController.view.frame = CGRectMake(1024, 0, 1024, 708)
        contentScrollView.addSubview(topicsPageViewController.view)
        self.addChildViewController(topicsPageViewController)
        
        coursewareViewController = CoursewareViewController(nibName:"CoursewareView",bundle:NSBundle.mainBundle())
        coursewareViewController.view.frame = CGRectMake(2048, 0, 1024, 708)
        contentScrollView.addSubview(coursewareViewController.view)
        self.addChildViewController(coursewareViewController)
        
        videoViewController = VideoViewController(nibName:"VideoView",bundle:NSBundle.mainBundle())
        videoViewController.view.frame = CGRectMake(3072, 0, 1024, 708)
        contentScrollView.addSubview(videoViewController.view)
        self.addChildViewController(videoViewController)
        
        teachingMaterialViewController = TeachingMaterialViewController(nibName:"TeachingMaterialView",bundle:NSBundle.mainBundle())
        teachingMaterialViewController.view.frame = CGRectMake(4096, 0, 1024, 708)
        contentScrollView.addSubview(teachingMaterialViewController.view)
        self.addChildViewController(teachingMaterialViewController)
        
        timeLineViewController = TimeLineViewController(nibName:"TimeLineView",bundle:NSBundle.mainBundle())
        timeLineViewController.view.frame = CGRectMake(5120, 0, 1024, 708)
        contentScrollView.addSubview(timeLineViewController.view)
        self.addChildViewController(timeLineViewController)
        
        contentScrollView.contentSize = CGSizeMake(6144, 708);
        homeBtn.backgroundColor = color
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
    
    
    @IBAction func modelMenuClick(sender: AnyObject) {
        let button:UIButton = sender as! UIButton
        clearMenuBtnBg()
        button.backgroundColor = color
        
        contentScrollView.scrollRectToVisible(CGRectMake(CGFloat((button.tag - 1) * 1024), 0, 1024,708), animated: true)
        
    }
    
    func clearMenuBtnBg(){
        homeBtn.backgroundColor = UIColor.clearColor()
        topicsBtn.backgroundColor = UIColor.clearColor()
        courseBtn.backgroundColor = UIColor.clearColor()
        videoBtn.backgroundColor = UIColor.clearColor()
        teachingMaterialBtn.backgroundColor = UIColor.clearColor()
        timeLineBtn.backgroundColor = UIColor.clearColor()
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        clearMenuBtnBg()
        let pageWidth:CGFloat = scrollView.frame.size.width;
        // 根据当前的x坐标和页宽度计算出当前页数
        let currentPage:Int = Int((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
        print(currentPage)
        
        if (currentPage == 0){
            homeBtn.backgroundColor = color
        }
        else if (currentPage == 1){
            topicsBtn.backgroundColor = color
        }
        else if (currentPage == 2){
            courseBtn.backgroundColor = color
        }
        else if (currentPage == 3){
            videoBtn.backgroundColor = color
        }
        else if (currentPage == 4){
            teachingMaterialBtn.backgroundColor = color
        }
        else if (currentPage == 5){
            timeLineBtn.backgroundColor = color
        }
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
       
    }
    
    func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView) {
        
        
    }
    
}
