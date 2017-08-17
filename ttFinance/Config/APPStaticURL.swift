//
//  APPStaticURL.swift
//  ttFinance
//
//  Created by LiuRex on 17/4/22.
//  Copyright © 2017年 Shanghai Youyou Finance Information Technology Co.,Ltd. All rights reserved.
//

import UIKit

struct AppStaticURL {

    // 关于投投
    static let abountToutou = "https://wx.toutoujinrong.com/html/app/about-toutou.html"
    
    // 安全保障
    static let security = "https://wx.toutoujinrong.com/html/app/security-toutou.html"
    
    static let question = "https://wx.toutoujinrong.com/wx/html/vipUser/html/help-faq.html"
}


struct AppRequestURL {
    
    static let global = "https://mapi.toutoujinrong.com/gzip/optt/munions/"
    
    static let system = "system/ttfunction.json"
    
    static let secondmy = "secondmy/ttfunction.json"
}


struct AppRequestType {
    
    /*
     *  登录
     */
   static let LG001 = "LG001"
    
    /*
     * 登出
     */
    static let LG002 = "LG002"

    
    /*
     *  用户属性
     */
   static let UA001 = "UA001"
    
    /*
     *  个人基本信息
     */
   static let MY011 = "MY011"

}



