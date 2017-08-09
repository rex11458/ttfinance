//
//  UIButton+Extensions.swift
//  ttFinance
//
//  Created by LiuRex on 17/4/21.
//  Copyright © 2017年 Shanghai Youyou Finance Information Technology Co.,Ltd. All rights reserved.
//

import UIKit

extension UIButton {
    
    convenience init(title:String = "", titleColor: UIColor = UIColor.white, titleFont: UIFont = AppConstantFont._14px,image: UIImage = UIImage(),selectedImage:UIImage = UIImage(), redius: CGFloat = 0,  borderWidth: CGFloat = 0, borderColor:UIColor = UIColor.clear) {
    
        self.init()
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.titleLabel?.font = titleFont
        self.setImage(image, for: .normal)
        self.layer.cornerRadius = redius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = AppConstantColor.border.cgColor
    }
    
    public class func custom(title:String) -> UIButton{
     
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 5.0
        button.layer.masksToBounds = true
        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.setBackgroundImage(AppConstantColor.main.image, for: .normal)
        button.setBackgroundImage(AppConstantColor.disable.image, for: .disabled)

        return button
    }
}
