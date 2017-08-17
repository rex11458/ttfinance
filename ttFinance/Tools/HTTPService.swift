//
//  NetworkService.swift
//  Alamofire_demo
//
//  Created by LiuRex on 17/4/19.
//  Copyright © 2017年 Shanghai Youyou Finance Information Technology Co.,Ltd. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class HTTPService: SessionManager {
    
    var baseURL:String {
        return AppRequestURL.global
    }
   static let sharedInstance = HTTPService()
    
}

extension HTTPService {
    
    func request(method:HTTPMethod, url:String,buildType:String,paramters:[String : Any],completion:@escaping (_ response:[String:Any]?,_ error:Error?)->()) -> URLSessionTask {
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        let req: DataRequest? = Alamofire.request(absoluteURL(url: url,buildType:buildType), method: method, parameters: absoluteParamters(paramters: paramters,buildType: buildType),encoding:JSONEncoding.default)
        UIApplication.shared.isNetworkActivityIndicatorVisible = false

        if let request:DataRequest = req {
         
            request.responseString(completionHandler: { (response) in
                
                let value:String = String.check(response.result.value)
                let json = JSON(parseJSON: value)
                let resp = json["model"]["responseBody"].string
                guard  resp != nil else {
                    
                    completion(nil,response.error)
                    return;
                }
        
                let data: Data =  Data(base64Encoded: resp!.data(using: .utf8)!, options: .ignoreUnknownCharacters)!
                
                completion(JSON(data).rawValue as? [String : Any],response.error)
            })
        }
        return (req?.task)!
    }
    
    private func absoluteURL(url: String, buildType:String) -> URL{
        
        var absoluteURL:String = self.baseURL
        
        absoluteURL.append(url + "?businType=\(buildType)")
        
        return URL(string:absoluteURL)!
    }
    
    private func absoluteParamters(paramters:[String: Any],buildType:String) ->[String: Any] {
     
        
        let systemVersion:String = "132"
        
        let transTime = Date.now()
        
        var param:[String: Any] = paramters
        param["instId"] = "LT0000001"
        
        let bodyparams = ["request" : param]
        
        let json:String = JSON(bodyparams).rawString(.utf8, options: [])!
    
        let requestBody = json.data(using: .utf8)?.base64EncodedString()
       
        let signature = requestBody?.md5()
        let sstoken = ""
        
        let params = [
            "Message" : [
                "requestBody": String.check(requestBody),
                "businType"  : String.check(buildType),
                "transTime"  : String.check(transTime),
                "signature"  : String.check(signature),
                "sstoken"    : String.check(sstoken),
                "version"    : systemVersion,
                "id"         : "A00000000000001",
                "instId"     : "LT0000001",
                "packSelect" : "200,600,200,600",
                "extension"  : ""
            ]
        ]
        return params
    }
}



