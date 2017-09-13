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
    /*常见问题*/
    static let question = "https://wx.toutoujinrong.com/wx/html/vipUser/html/help-faq.html"
}


struct AppRequestURL {
   
    /*BaseURL*/
    static let global = "https://mapi.toutoujinrong.com/gzip/optt/munions/"
   
    /*用户相关*/
    static let system = "system/ttfunction.json"
    /*忘记密码*/
    static let secondsystem = "secondsystem/secondfunction.json"

    
    /*我的*/
    static let my = "my/ttfunction.json"
    static let secondmy = "secondmy/ttfunction.json"
    
    
    
    /*消息*/
    static let thirdTalent = "thirdTalent/ttfunction.json"

    /*找大人*/
    static let app = "app/ttfunction.json"
    
    /*玖富产品*/
    static let jfproduct = "jfproduct/ttfunction.json"
 
    /*保险产品*/
    static let insuranceTrade = "insuranceTrade/ttfunction.json"

    /*FOF产品*/
    static let fof = "fof/ttfunction.json"
    
    /*资管产品*/
    static let zgtrade = "zgtrade/ttfunction.json"
    
    /*基金定投*/
    static let regularInvestment = "regularInvestment/ttfunction.json"
    
    /*藏金宝*/
    static let cjb = "cjb/ttfunction.json"

    /*个人资产*/
    static let asset = "asset/ttfunction.json"
 
    /*U活宝 + 投投钱包余额*/
    static let thirdmy = "thirdmy/ttfunction.json"
    
    /*U活宝申购、赎回*/
    static let baolei = "baolei/baolei.json"
    
    /*投投钱包*/
    static let bbunions = "bbunions/ttfunction.json"
    /*投投钱包相关*/
    static let secondBbunions = "secondBbunions/ttfunction.json"

    /*产品相关*/
    static let produces = "produces/ttfunction.json"
    
    /*投投币兑换*/
    static let action = "action/ttmfunction.json"
    
    /*红包摇一摇*/
    static let redRockPaper = "redRockPaper/ttfunction.json"
    
    /*优惠券*/
    static let coupons = "couponsActive/ttfunction.json"
    
    /*启动配置*/
    static let invest = "invest/ttfunction.json"

    /*排行*/
    static let rank = "rank/ttfunction.json"

    /*分类*/
    static let category = "category/ttfunction.json"

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
    
    
    /*
     *  未读消息数
     */
    static let MS006 = "MS006"

    /*
     *  消息列表
     */
    static let MS007 = "MS007"
    /*
     *  修改消息为已读
     */
    static let MS008 = "MS008"
    /*
     * 删除消息
     */
    static let MS009 = "MS009"
    
    
    
    /*
     *  保险产品申购申请
     */
    static let BX001 = "BX001"
    /*
     *   保险产品申购确认
     */
    static let BX002 = "BX002"
    /*
     * 保险产品申购
     */
    static let BX003 = "BX003"
    /*
     *  保险产品赎回申请
     */
    static let BX004 = "BX004"
    /*
     * 保险产品赎回
     */
    static let BX005 = "BX005"

}



