//
//  SettingHeaderView.swift
//  ttFinance
//
//  Created by LiuRex on 17/4/27.
//  Copyright © 2017年 Shanghai Youyou Finance Information Technology Co.,Ltd. All rights reserved.
//

import UIKit

let settingViewHeight:CGFloat = 66.0

class SettingHeaderView: UIView {

    var label:UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.configSubView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func  configSubView() {
        self.backgroundColor = AppConstantColor.block
        label = UILabel(textColor: AppConstantColor.important, font: AppConstantFont._16px)
        label?.backgroundColor = .white
        self.addSubview(label!)
        label?.snp.makeConstraints({ (make) in
            make.edges.equalTo(UIEdgeInsetsMake(10, 0, 0, 0 ))
        })
        
        self.fill()
    }
    
    func fill() {
        
        var phone = UserManager.sharedInstance.user?.phone
        
        guard phone != nil else {
            return
        }
        
        phone  = String.asteriskProtection(string: phone!)
        
        let desc = "  手机号：".appending(phone!)
        label?.text = desc
    }
}
