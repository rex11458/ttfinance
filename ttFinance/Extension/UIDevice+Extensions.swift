//
//  UIDevice+Extension.swift
//  ttFinance
//
//  Created by LiuRex on 17/4/22.
//  Copyright © 2017年 Shanghai Youyou Finance Information Technology Co.,Ltd. All rights reserved.
//

import UIKit


extension UIDevice {
    
   static func uuidString()-> String {
        
        if let s = UIDevice.current.identifierForVendor?.uuidString {
            return s
        }
    
    
        
        return ""
    }
    
 
}
