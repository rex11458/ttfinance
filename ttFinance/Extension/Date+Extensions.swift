//
//  Date.swift
//  ttFinance
//
//  Created by LiuRex on 17/4/22.
//  Copyright © 2017年 Shanghai Youyou Finance Information Technology Co.,Ltd. All rights reserved.
//

import UIKit

extension Date {
    
   static func now() -> String! {
        
        let dateFormat = DateFormatter()
        
        dateFormat.dateFormat = "yyyyMMddHHmmss"
        
       return dateFormat.string(from: Date())
   
    }
}
