//
//  User.swift
//  ttFinance
//
//  Created by LiuRex on 17/4/25.
//  Copyright © 2017年 Shanghai Youyou Finance Information Technology Co.,Ltd. All rights reserved.
//

import UIKit
import ObjectMapper
class User: BaseModel {

    var userID: String = ""
    var sstoken: String = ""
    var phone: String = ""
    
    var moneyAccount: String?
    var bankCity:String?
    var isOpen: Bool = false
    var isTrade: Bool = false
    var isTransPwd: Bool = false
    
    var bankCard:BankCard?
    
    
    var name:String?
    var portrait:String?
    var signature:String?
    
    
     override func mapping(map: Map) {
        
        userID <- map["userID"]
        sstoken <- map["sstoken"]

        name <- map["nickName"]
        signature <- map["signature"]
        portrait <- map["headerimg"]
        super.mapping(map: map)
    }
    
    public func setAttributes(attributes:UserAttributes) {
     
        func result(value:String) -> Bool {
            
            if value == "true" {
                return true
            }else{
                return false
            }
        }
        
        if let list = attributes.list {
            for keyValues in list {
                
                if let key = keyValues.code {
                 
                    switch key {
                    case "getMoneyAccountName":
                        moneyAccount = String.check(keyValues.value)
                    case "isTrade":
                        isTrade = result(value: String.check(keyValues.value))
                    case "isTransPwd":
                        isTransPwd = (NumberFormatter().number(from: String.check(keyValues.value))?.boolValue)!
                    case "isOpen":
                        isOpen = result(value: String.check(keyValues.value))
                    case "getBankCityInfo":
                        bankCity = String.check(keyValues.value)
                    case "getMoneyAccount":
                        moneyAccount = String.check(keyValues.value)
                    case "getMoneyAccountBankId":
                        
                      bankCard = Mapper<BankCard>().map(JSONString: String.check(keyValues.value))
                        
                    default:
                        
                        break
                    }
                }
            }
        }
    }
}

class BankCard: Mappable {
    
    var code    : String?
    var bankName: String?
    var bankIcon: String?
    var maxAmount: String?
    var bankMaxLimit:String?
    
   required init?(map: Map) {
        
    }
    
     func mapping(map: Map) {
        
        code <- map["code"]
        bankName <- map["bankName"]
        bankIcon <- map["bankIcon"]
        maxAmount <- map["maxAmount"]
        bankMaxLimit <- map["bankMaxLimit"]

    }
}

