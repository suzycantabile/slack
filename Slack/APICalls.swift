//
//  APICalls.swift
//  Slack
//
//  Created by Suzy Cantabile on 7/8/15.
//  Copyright (c) 2015 Suzy Cantabile. All rights reserved.
//

import Foundation

class APICalls{
    class func getSlackMembers(completed:(members:NSArray!)->()){
        let url:NSURL! = NSURL(string: "https://slack.com/api/users.list?token=xoxp-4698769766-4698769768-4898023905-7a1afa")
        let request: NSMutableURLRequest = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "GET"

        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue()) { (response, data, error) -> Void in
            if(error == nil){
                var err: NSError?

                var jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers, error: &err) as! NSDictionary
                completed(members: jsonResult.valueForKey("members") as! NSArray)
            }else{
                // handle error
                println(error)
                completed(members: nil)
            }
        }
    }
}
