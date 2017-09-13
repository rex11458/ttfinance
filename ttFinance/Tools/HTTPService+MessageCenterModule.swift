//
//  HTTPService+MessageCenterModule.swift
//  ttFinance
//
//  Created by LiuRex on 2017/8/18.
//  Copyright © 2017年 Shanghai Youyou Finance Information Technology Co.,Ltd. All rights reserved.
//

import UIKit
import ObjectMapper

extension HTTPService {
    
    /*
     *  红点提示
     */
    @discardableResult
    func messageCenter(completion: @escaping(_ result:BaseModel) -> ()) -> URLSessionTask {
       
        let userID =  UserManager.sharedInstance.user?.userID
        let paramters:[String:Any] = ["userID" : String.check(userID)]

        
        return  self.request(method: .post, url: AppRequestURL.system,buildType:AppRequestType.LG001, paramters: paramters) { (result, error) in
            
            guard  result != nil else {
                completion(BaseModel(message: error?.localizedDescription))
                return
            }
            
            let user:User = Mapper<User>().map(JSONObject: result)!
            guard let code = user.code, code == ErrorCode.code_0000 else {
                
                completion(user)
                
                return
            }
   
        }
        
    }
}
