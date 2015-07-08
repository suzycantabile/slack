//
//  TeamTableViewController.swift
//  Slack
//
//  Created by Suzy Cantabile on 7/8/15.
//  Copyright (c) 2015 Suzy Cantabile. All rights reserved.
//

import Foundation
import UIKit

class TeamTableViewController:UITableViewController{
    var memberArray:NSArray!
    var detailViewController = TeamMemberDetailViewController()
    


    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Slack"
        let titleValues: NSDictionary = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationController?.navigationBar.titleTextAttributes = titleValues as [NSObject : AnyObject]
        
        APICalls.getSlackMembers({ (members) -> () in
            self.memberArray = members
            if(self.memberArray != nil){
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.tableView.reloadData()
                })
            }
            
            
        })
        self.view.backgroundColor = UIColor.whiteColor()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(self.memberArray == nil){
            return 0
        }else{
            return self.memberArray.count
        }
    }
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = NSString(format: "Teammate:%d", indexPath.row)
        
        var cell:UITableViewCell! = self.tableView.dequeueReusableCellWithIdentifier(cellIdentifier as String) as! UITableViewCell!
        if(cell == nil){
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
            let memberDicValue:NSDictionary! = self.memberArray.objectAtIndex(indexPath.row) as! NSDictionary
            cell.textLabel?.text = memberDicValue.objectForKey("real_name") as? String
            cell.accessoryType = .DisclosureIndicator
            cell.selectionStyle = .None
        }
        
        return cell
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let memberDicValue:NSDictionary! = self.memberArray.objectAtIndex(indexPath.row) as! NSDictionary
        let profile:NSDictionary! = memberDicValue.objectForKey("profile") as! NSDictionary!
        
        var name:String! = nil
        var realname:String! = nil
        var profilePic:String! = nil
        var title:String! = nil
        var skype:String! = nil
        var phone:String! = nil
        var email:String! = nil
        if(memberDicValue.objectForKey("name") != nil){
            name = memberDicValue.objectForKey("name") as! String
        }
        if(memberDicValue.objectForKey("real_name") != nil){
            realname = memberDicValue.objectForKey("real_name") as! String
        }
        if(profile.objectForKey("image_192") != nil){
            profilePic = profile.objectForKey("image_192") as! String
        }
        if(profile.objectForKey("title") != nil){
            title = profile.objectForKey("title") as! String
        }
        if(profile.objectForKey("skype") != nil ){
            skype = profile.objectForKey("skype") as! String
        }
        if(profile.objectForKey("phone") != nil){
            phone = profile.objectForKey("phone") as! String
        }
        if(profile.objectForKey("email") != nil){
            email = profile.objectForKey("email") as! String
        }
        

        let keys = ["name", "realname", "profile","title","skype","phone","email"]
        let values = [name, realname, profilePic, title, skype, phone, email]
        let userDict:NSDictionary = NSDictionary(objects: values, forKeys: keys)
        self.detailViewController.setUpDetailedProfileView(userDict)
        self.navigationController?.pushViewController(self.detailViewController, animated: true)
    }
    

    
}