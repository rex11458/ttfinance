//
//  UILabel+Extensions.swift
//  ttFinance
//
//  Created by LiuRex on 17/4/21.
//  Copyright © 2017年 Shanghai Youyou Finance Information Technology Co.,Ltd. All rights reserved.
//

import UIKit


extension UILabel {
    
    convenience init(text:String = "", textColor: UIColor, font: UIFont) {
        self.init()
        self.text = text
        self.textColor = textColor
        self.font = font
        self.backgroundColor = UIColor.clear
    }
}
