//
//  TeamMemberDetailViewController.swift
//  Slack
//
//  Created by Suzy Cantabile on 7/8/15.
//  Copyright (c) 2015 Suzy Cantabile. All rights reserved.
//

import Foundation
import UIKit

class TeamMemberDetailViewController:UIViewController, UITextFieldDelegate, UIGestureRecognizerDelegate{
    var profileImage:UIImageView! = UIImageView(frame: CGRectMake(0, 0, 72, 72))
    
    var nameView:UIView = UIView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, 45))
    var realNameView:UIView = UIView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, 45))
    var titleView:UIView = UIView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, 45))
    var emailView:UIView = UIView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, 45))
    var phoneView:UIView = UIView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, 45))
    var skypeView:UIView = UIView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, 45))

    var nameTextField:UITextField = UITextField(frame: CGRectMake(50, 0, UIScreen.mainScreen().bounds.width-50, 45))
    var realNameTextField:UITextField = UITextField(frame: CGRectMake(50, 0, UIScreen.mainScreen().bounds.width-50, 45))
    var titleTextField:UITextField = UITextField(frame: CGRectMake(50, 0, UIScreen.mainScreen().bounds.width-50, 45))
    var emailTextField:UITextField = UITextField(frame: CGRectMake(50, 0, UIScreen.mainScreen().bounds.width-50, 45))
    var phoneTextField:UITextField = UITextField(frame: CGRectMake(50, 0, UIScreen.mainScreen().bounds.width-50, 45))
    var skypeTextField:UITextField = UITextField(frame: CGRectMake(50, 0, UIScreen.mainScreen().bounds.width-50, 45))

    let popupView:UILabel = UILabel(frame: CGRectMake(0, 0, 100, 70))

    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        return false

    }
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailByGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }


    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Detailed Profile"

        self.view.backgroundColor = UIColor(red: 236/255, green: 240/255, blue: 241/255, alpha: 1.0)
        
        self.popupView.layer.cornerRadius = 5
        self.popupView.layer.masksToBounds = true
        self.popupView.frame.origin = CGPointMake((self.view.frame.size.width - self.popupView.frame.size.width)/2, (self.view.frame.size.height - self.popupView.frame.size.height)/2 - 100)
        self.popupView.backgroundColor = UIColor.darkGrayColor()
        self.popupView.text = "Copied!"
        self.popupView.textColor = UIColor.whiteColor()
        self.popupView.textAlignment = .Center
        

        self.titleTextField.delegate = self
        self.emailTextField.delegate = self
        self.phoneTextField.delegate = self
        self.skypeTextField.delegate = self
        
        self.edgesForExtendedLayout = .None;
        
        self.view.addSubview(self.nameView)
        self.view.addSubview(self.realNameView)
        self.view.addSubview(titleView)
        self.view.addSubview(emailView)
        self.view.addSubview(phoneView)
        self.view.addSubview(skypeView)

        
        nameView.frame.origin.y = profileImage.frame.size.height + 20
        realNameView.frame.origin.y = nameView.frame.size.height + nameView.frame.origin.y + 3
        titleView.frame.origin.y = realNameView.frame.size.height + realNameView.frame.origin.y + 3
        emailView.frame.origin.y = titleView.frame.size.height + titleView.frame.origin.y + 3
        phoneView.frame.origin.y = emailView.frame.size.height + emailView.frame.origin.y + 3
        skypeView.frame.origin.y = phoneView.frame.size.height + phoneView.frame.origin.y + 3
        
        nameView.backgroundColor = UIColor.whiteColor()
        realNameView.backgroundColor = UIColor.whiteColor()
        titleView.backgroundColor = UIColor.whiteColor()
        emailView.backgroundColor = UIColor.whiteColor()
        phoneView.backgroundColor = UIColor.whiteColor()
        skypeView.backgroundColor = UIColor.whiteColor()
        
        let nameImg = UIImage(named:"name")
        let realNameImg = UIImage(named: "realname")
        let titleImg = UIImage(named: "title")
        let emailImg = UIImage(named: "email")
        let phoneImg = UIImage(named: "phone")
        let skypeImg = UIImage(named: "skype")
        
        let nameImgView = UIImageView(image: nameImg)
        nameImgView.frame.origin = CGPointMake(5, (self.nameView.frame.size.height - nameImg!.size.height)/2)
        let realNameImgView = UIImageView(image: realNameImg)
        realNameImgView.frame.origin = CGPointMake(5, (self.realNameView.frame.size.height - realNameImg!.size.height)/2)
        let titleImgView = UIImageView(image: titleImg)
        titleImgView.frame.origin = CGPointMake(5, (self.titleView.frame.size.height - titleImg!.size.height)/2)
        let emailImgView = UIImageView(image: emailImg)
        emailImgView.frame.origin = CGPointMake(5, (self.emailView.frame.size.height - emailImg!.size.height)/2)
        let phoneImgView = UIImageView(image: phoneImg)
        phoneImgView.frame.origin = CGPointMake(10, (self.phoneView.frame.size.height - phoneImg!.size.height)/2)
        let skypeImgView = UIImageView(image: skypeImg)
        skypeImgView.frame.origin = CGPointMake(5, (self.skypeView.frame.size.height - skypeImg!.size.height)/2)
        
        nameTextField.placeholder = "name"
        realNameTextField.placeholder = "realName"
        titleTextField.placeholder = "title"
        emailTextField.placeholder = "email"
        phoneTextField.placeholder = "phone"
        skypeTextField.placeholder = "skype"

        var emailGesture = UITapGestureRecognizer(target: self, action: Selector("emailTap:"))
        emailGesture.delegate = self
        self.emailTextField.addGestureRecognizer(emailGesture)
        var phoneGesture = UITapGestureRecognizer(target: self, action: Selector("phoneTap:"))
        phoneGesture.delegate = self
        self.phoneTextField.addGestureRecognizer(phoneGesture)
        var skypeGesture = UITapGestureRecognizer(target: self, action: Selector("skypeTap:"))
        skypeGesture.delegate = self
        self.skypeTextField.addGestureRecognizer(skypeGesture)
        
        nameView.addSubview(nameTextField)
        realNameView.addSubview(realNameTextField)
        titleView.addSubview(titleTextField)
        emailView.addSubview(emailTextField)
        phoneView.addSubview(phoneTextField)
        skypeView.addSubview(skypeTextField)
        
        nameView.addSubview(nameImgView)
        realNameView.addSubview(realNameImgView)
        titleView.addSubview(titleImgView)
        emailView.addSubview(emailImgView)
        phoneView.addSubview(phoneImgView)
        skypeView.addSubview(skypeImgView)
        
        profileImage.backgroundColor = UIColor.lightGrayColor()
        profileImage.frame.origin = CGPoint(x: (self.view.frame.size.width-profileImage.frame.size.width)/2, y: 10)
        profileImage.layer.cornerRadius = 10
        profileImage.layer.masksToBounds = true
        self.view.addSubview(profileImage)
        
        //self.setUpDetailedProfileView()
    }

    func emailTap(sender : UIGestureRecognizer) {
        let pb: UIPasteboard! = UIPasteboard.generalPasteboard()
        pb.string = self.emailTextField.text
        self.popupAnimation()

    }
    func phoneTap(sender : UIGestureRecognizer) {
        let pb: UIPasteboard! = UIPasteboard.generalPasteboard()
        pb.string = self.phoneTextField.text
        self.popupAnimation()

    }
    func skypeTap(sender : UIGestureRecognizer) {
        let pb: UIPasteboard! = UIPasteboard.generalPasteboard()
        pb.string = self.skypeTextField.text
        self.popupAnimation()

    }
    
    func popupAnimation(){
        self.popupView.alpha = 1.0
        self.view.addSubview(self.popupView)
        UIView.animateWithDuration(0.5, delay: 0.5, options: UIViewAnimationOptions.TransitionNone, animations: { () -> Void in
            self.popupView.alpha = 0.0

        }) { (completed) -> Void in
            self.popupView.removeFromSuperview()

        }

    }
    func setUpDetailedProfileView(fields:NSDictionary){
        //let keys = ["name", "realname", "profile","title","skype","phone","email"]

        if(fields.objectForKey("profile") != nil){
            let imageURL:NSURL! = NSURL(string: fields.objectForKey("profile") as! String)
            let imageData:NSData! = NSData(contentsOfURL: imageURL)
            let profileImg:UIImage? = UIImage(data: imageData, scale: UIScreen.mainScreen().scale)
            self.profileImage.image = profileImg
        }
        if(fields.objectForKey("name") != nil){
            let name = fields.objectForKey("name") as! String
            self.nameTextField.text = name
        }
        if(fields.objectForKey("realname") != nil){
            let realname = fields.objectForKey("realname") as! String
            self.realNameTextField.text = realname
        }
        if(fields.objectForKey("title") != nil){
            let title = fields.objectForKey("title") as! String
            self.titleTextField.text = title
        }
        if(fields.objectForKey("email") != nil){
            let email = fields.objectForKey("email") as! String
            self.emailTextField.text = email
        }
        if(fields.objectForKey("phone") != nil){
            let phone = fields.objectForKey("phone") as! String
            self.phoneTextField.text = phone
        }
        if(fields.objectForKey("skype") != nil){
            let skype = fields.objectForKey("skype") as! String
            self.skypeTextField.text = skype
        }
        
        
        
    }
    
}