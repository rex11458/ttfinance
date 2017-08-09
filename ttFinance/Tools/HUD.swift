//
//  HUD.swift
//  ttFinance
//
//  Created by LiuRex on 17/4/26.
//  Copyright © 2017年 Shanghai Youyou Finance Information Technology Co.,Ltd. All rights reserved.
//

import UIKit
import SVProgressHUD

let dismissTimeInterval = 1.5

class HUD: UIView {
    
    public class func loading(message:String =  "正在执行...") {

        SVProgressHUD.setDefaultMaskType(.clear)
        SVProgressHUD.setMinimumSize(CGSize(width: 120, height: 120))
        SVProgressHUD.show(withStatus:message)
    }
    
    public class func dismiss(){
        self.configuration()
        SVProgressHUD.dismiss()
    }
    
     public class func success(message:String!){
        self.configuration()
        SVProgressHUD.showSuccess(withStatus: message)
    }
    
     public class func error(message:String!){
        self.configuration()
        SVProgressHUD.showError(withStatus: message)
    }
    
     public class func defaultError() {
        self.error(message: "状态异常～")
    }
    
     public class func configuration() {
     
        SVProgressHUD.setMinimumDismissTimeInterval(dismissTimeInterval)
        SVProgressHUD.setDefaultMaskType(.none)
        SVProgressHUD.setMinimumSize(CGSize(width: 120, height: 120))
    }
}

