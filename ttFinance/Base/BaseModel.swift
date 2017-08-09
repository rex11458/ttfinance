//
//  BaseModel.swift
//  ttFinance
//
//  Created by LiuRex on 17/4/25.
//  Copyright © 2017年 Shanghai Youyou Finance Information Technology Co.,Ltd. All rights reserved.
//

import UIKit
import ObjectMapper

enum ErrorCode: String{
    case code_0000 = "0000"
    
    case code_0001 = "0001"
  
    case code_0002 = "0002"
    
    /*
     *  请求出错
     */
    case code_9998 = "9998"
}

class BaseModel: Mappable {
    
    var message:String = "状态异常~"
    var code:ErrorCode?
    
    init(message:String?,code:ErrorCode = .code_9998) {
        
        guard message != nil else {
            return
        }
        self.message = message!

        self.code = code
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        message <- map["errorMessage"]
        code <- map["errorCode"]
        
    }
}
