//
//  HTTPService+LoginModule.swift
//  ttFinance
//
//  Created by LiuRex on 17/4/22.
//  Copyright © 2017年 Shanghai Youyou Finance Information Technology Co.,Ltd. All rights reserved.
//

import UIKit
import ObjectMapper
extension HTTPService {
    
    @discardableResult
    func login(phone:String, password: String,completion:@escaping(_ result:BaseModel)->()) -> URLSessionTask {
        let paramters: [String : Any] = [
            "mobile" : String.check(phone),
            "password" : password.secure(),
            "deviceNo" : UIDevice.uuidString(),
            "deviceName": AppInformation.deviceDescription,
            "wechatId" : "",
        ]
    
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
            
            UserManager.sharedInstance.user = user
            user.phone = phone

           let userID = user.userID
            
          _ = self.userProperty(userID: userID,completion:completion)
            
        }
    }
    
    /*
     *  用户属性
     */
    @discardableResult
    func userProperty(userID:String, completion:@escaping(_ result:BaseModel)->()) -> URLSessionTask {
     
        let param:[String:Any] = ["userID" : String.check(userID)]
        
        return  self.request(method: .post, url: AppRequestURL.system,buildType:AppRequestType.UA001, paramters:param ) { (result, error) in
            
            guard  result != nil else {
                completion(BaseModel(message: error?.localizedDescription))
                return
            }
            
            let userAttributes:UserAttributes = Mapper<UserAttributes>().map(JSONObject: result)!
            
            guard let code = userAttributes.code, code == ErrorCode.code_0000 else {
                completion(userAttributes)
                return
            }
            
            let user = UserManager.sharedInstance.user
            user?.setAttributes(attributes: userAttributes)
            completion(user!)
        }
    }
    
    /*
     *  用户基本信息
     */
    @discardableResult
    func userBasicInformation(completion:@escaping(_ result:BaseModel)->()) -> URLSessionTask {
        
        let param: [String : Any] = ["userID" : String.check(UserManager.sharedInstance.user?.userID)]
        return  self.request(method: .post, url: AppRequestURL.secondmy,buildType:AppRequestType.MY011, paramters:param ) { (result, error) in
            
            guard  result != nil else {
                completion(BaseModel(message: error?.localizedDescription))
                return
            }
            
            let u:User = Mapper<User>().map(JSONObject: result)!
            
            guard let code = u.code, code == ErrorCode.code_0000 else {
                completion(u)
                return
            }
            
            let user = UserManager.sharedInstance.user
          
            user?.name = u.name
            user?.signature = u.signature
            user?.portrait = u.portrait
            UserManager.sharedInstance.user = user
            
            completion(user!)
        }
    }
    
    @discardableResult
    func logout(completion:@escaping(_ result:BaseModel)->()) -> URLSessionTask {
        let userID =  UserManager.sharedInstance.user?.userID
        let param: [String : Any] = ["userID" : String.check(userID)]

        return  self.request(method: .post, url: AppRequestURL.system,buildType:AppRequestType.LG002, paramters:param ) { (result, error) in
            
            guard  result != nil else {
                completion(BaseModel(message: error?.localizedDescription))
                return
            }
            
            let model:BaseModel = Mapper<BaseModel>().map(JSONObject: result)!
            
            completion(model)

        }
    }
}

