//
//  MenuItemCell.swift
//  DesignCourse
//
//  Created by lotusprize on 15/9/30.
//  Copyright © 2015年 geekTeam. All rights reserved.
//

import UIKit

class MenuItemCell: UITableViewCell{
    
    @IBOutlet weak var iconImage: UIImageView!
    
    @IBOutlet weak var courseName: UILabel!
    
    func configureForMenuItem(menuItem:NSDictionary){
        iconImage.image = UIImage(named: menuItem["icon"] as! String)
        courseName.text = menuItem["name"] as? String
    }
}
