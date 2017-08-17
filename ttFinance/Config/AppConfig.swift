//
//  AppConfig.swift
//  ttFinance
//
//  Created by LiuRex on 17/4/21.
//  Copyright © 2017年 Shanghai Youyou Finance Information Technology Co.,Ltd. All rights reserved.
//


import UIKit
import SnapKit
import ObjectMapper

struct AppConstantColor {
   
    /*---------------- 颜色 ----------------------*/
    /*
     *  主色调
     *  企业形象色，网站风格色，主要控件、导航、申购按钮、推荐标签、
     *  icon、重要文字
     */
    static let main = UIColor(0xF2590D)
    
    /*
     *  辅助色
     *  赎回、取出功能按钮或者icon、基金类型icon
     */
    static let takeOut = UIColor(0x29ABE2)
    
    /*
     *  用于收益为正的数值
     */
    static let increase = UIColor(0xFF482A)
    
    /*
     * 用于收益为负的数值
     */
    static let decrease = UIColor(0x07A168)
    
    /*
     *  灰色辅助系
     *  用于重要文字信息，如标题、话题正文
     */
    static let important = UIColor(0x333333)
    /*
     *  用于次级文字信息
     */
    static let secondary = UIColor(0x666666)
    
    /*
     *  用于最弱级文字信息
     */
    static let weak = UIColor(0x999999)
    
    /*
     *  用于置灰按钮和输入框placeholder
     */
    static let disable = UIColor(0xC6C6C6)
    
    /*
     *  用于线条、板块边框
     */
    static let border: UIColor = UIColor(0xE6E6E6)
    
    /*
     *  用于板块分隔背景
     */
    static let block = UIColor(0xF9F9F9)
    
    /*
     *  用于背景颜色
     */
    static let background = UIColor(0xFFFFFF)
    
    /*
     *  cell选中后颜色
     */
    static let selected = UIColor(white: 0.8, alpha: 0.2)
    
    /*
     *  模态框背景颜色
     */
    static let modal = UIColor(white: 0.2, alpha: 0.65)
}

struct AppConstantFont {
    
    /*--------------------------字体--------------------------------*/
    
   static func mediumFontDescriptor() -> UIFontDescriptor {
        
        return UIFontDescriptor(fontAttributes: [UIFontDescriptorFamilyAttribute: "PingFang SC",UIFontDescriptorNameAttribute:"PingFangSC-Medium"
            ])
    }
    
   static func regularFontDescriptor() -> UIFontDescriptor {
        
        return UIFontDescriptor(fontAttributes: [UIFontDescriptorFamilyAttribute: "PingFang SC",UIFontDescriptorNameAttribute:"PingFangSC-Regular"
            ])
    }
    
   static func lightFontDescriptor() -> UIFontDescriptor {
        
        return UIFontDescriptor(fontAttributes: [UIFontDescriptorFamilyAttribute: "PingFang SC",UIFontDescriptorNameAttribute:"PingFangSC-Light"
            ])
    }
    
    /*
     *       font : 36px
     * font-family:平方－简 中粗体
     *         适用：收益数值(U活宝、投投钱包)
     */
    static let _36px = UIFont(descriptor: mediumFontDescriptor(), size: 36)
    /*
     *       font : 24px
     * font-family:平方－简 中粗体
     *         适用：文章标题
     */
   static let _24px = UIFont(descriptor: regularFontDescriptor(), size: 24)
    
    /*
     *       font : 18px
     * font-family:平方－简 中粗体
     *         适用：一级标题产品标题、模块标题、按钮文字
     */
   static let _18px = UIFont(descriptor: regularFontDescriptor(), size: 18)
    
    /*
     *       font : 16px
     * font-family:平方－简 常规体
     *         适用：二级标题、正文等大多数文字
     */
   static let _16px = UIFont(descriptor: regularFontDescriptor(), size: 16)
    
    /*
     *       font : 14px
     * font-family:平方－简 常规体
     *         适用：用于次要文字
     */
   static let _14px = UIFont(descriptor: regularFontDescriptor(), size: 14)
    
    /*
     *       font : 12px
     * font-family:平方－简 常规体
     *         适用：辅助性文字
     */
   static let _12px = UIFont(descriptor: regularFontDescriptor(), size: 12)
    
    /*
     *       font : 10px
     * font-family:平方－简 常规体
     *         适用：底部导航栏文字
     */
    static let _10px = UIFont(descriptor: lightFontDescriptor(), size: 10)
    
    /*
     *       font : 60px
     * font-family: SF UI Display Regular
     *         适用："看收益"等模块中收益数额
     */
   static let _60px = UIFont(descriptor: regularFontDescriptor(), size: 60)
    
    /*
     *       font : 30px
     * font-family: SF UI Display Regular
     *         适用："看收益"等模块中收益数额
     */
   static let _30px = UIFont(descriptor: regularFontDescriptor(), size: 30)
    
    /*
     *       font : 20px
     * font-family: SF UI Display Regular
     *         适用：产品列表的收益率、资产结构中的总资产
     */
   static let _20px = UIFont(descriptor: regularFontDescriptor(), size: 20)
    
    /*
     *       font : 9px
     * font-family: SF UI Display Regular
     *         适用：走势图辅助性数字
     */
   static let _9px = UIFont(descriptor: lightFontDescriptor(), size: 9)

}

struct AppConstantHeight {
    
    static let button:CGFloat = 44.0
    
    static let tabbar:CGFloat = 49.0
    
    static let navigationbar:CGFloat = 64.0
    
    static let inputTextField: CGFloat = 40

}

struct AppConstantMargin {
    
    static let level1: CGFloat = 10.0
    
    static let level2: CGFloat = 15.0
    
    static let level3: CGFloat = 20.0
    
    static let level4: CGFloat = 30.0
    
    static let level5: CGFloat = 40.0

}

struct AppAnimationDuration {
    
    static let duration_25 = 0.25
}

struct AppContactInformation {
    static let qq1 = "3251175668"
    static let qq2 = "2957096294"
    static let qq3 = "2640782936"
    static let tel = "4001666788"


}


