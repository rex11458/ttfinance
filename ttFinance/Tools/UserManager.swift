//
//  UserManager.swift
//  ttFinance
//
//  Created by LiuRex on 17/4/23.
//  Copyright © 2017年 Shanghai Youyou Finance Information Technology Co.,Ltd. All rights reserved.
//

import UIKit


class UserManager: NSObject {

    var user:User?
    
    static let sharedInstance = UserManager()
    
    
    
    public class func isLogin() -> Bool {
     
       return UserManager.sharedInstance.user != nil
        
    }
}
