//
//  UserAttributes.swift
//  ttFinance
//
//  Created by LiuRex on 17/4/25.
//  Copyright © 2017年 Shanghai Youyou Finance Information Technology Co.,Ltd. All rights reserved.
//

import UIKit
import ObjectMapper

class UserAttributes: BaseModel {

    var list:[KeyValues]?
    
    override func mapping(map: Map) {
        list <- map["list"]

        super.mapping(map: map)
    }
    
}


class KeyValues:Mappable {
    
    var code:String?
    var value:String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        code <- map["code"]
        value <- map["value"]

    }
}

/*

 {
 code = getMoneyAccount;
 value = 711;
 },
 {
 code = getMoneyAccountBankId;
 value = "{\"code\":\"0310\",\"bankName\":\"\U6d66\U53d1\U94f6\U884c\",\"bankIcon\":\"https://wx.toutoujinrong.com/power/resourceroot/bank/icon_bank_pf.png\",\"bankLimit\":\"\U5355\U7b1450\U4e07\Uff0c\U5355\U65e5250\U4e07\",\"h5_bankLimit\":\"\U5355\U7b1450\U4e07\Uff0c\U5355\U65e5250\U4e07\",\"h5_bankIcon\":\"pf\",\"h5_maxAmount\":\"500000\",\"bankMaxLimit\":\"\U5355\U7b1450\U4e07\Uff0c\U5355\U65e5250\U4e07\",\"maxAmount\":\"500000\"}";
 },
 {
 code = getMoneyAccountName;
 value = "\U6d66\U53d1\U94f6\U884c(\U5c3e\U53f73540),\U901a\U8054\U6e20\U9053(\U5c3e\U53f73540)";
 },
 {
 code = getBankCityInfo;
 value = "\U4e0a\U6d77\U5e02-\U4e0a\U6d77\U5e02,\U4e0a\U6d77\U5e02-\U4e0a\U6d77\U5e02";
 },
 {
 code = isOpen;
 value = true;
 },
 {
 code = isTrade;
 value = true;
 },
 {
 code = isTransPwd;
 value = 1;
 }
 */
