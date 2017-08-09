//
//  String+Extensions.swift
//  ttFinance
//
//  Created by LiuRex on 17/4/22.
//  Copyright © 2017年 Shanghai Youyou Finance Information Technology Co.,Ltd. All rights reserved.
//

import Foundation


extension String {
    
    static func check(_ string: String?) -> String! {
    
        if let s = string {
            
            return s
        }

        return ""
    }
    
    func md5() -> String! {
        let cStr = self.cString(using: .utf8)
        
        if (cStr == nil) {
            return ""
        }
        
        let strLen = CUnsignedInt(self.lengthOfBytes(using: .utf8))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let buffer = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digestLen)
        CC_MD5(cStr!,strLen,buffer)
        
        let hash  = NSMutableString()
        
        for i in 0 ..< 16{
            hash.appendFormat("%02x", buffer[i])
        }
        buffer.deinitialize()
        return String.check(hash.uppercased)
    }
    
    func secure() -> String{

        var string:String = self.md5()
        let len = string.lengthOfBytes(using: .utf8)
        if len < 3 {
            return string
        }
        
      
        let r0 = string.startIndex ..< string.index(string.startIndex, offsetBy: 1)
        let r2 = string.index(string.startIndex, offsetBy: 2)..<string.index(string.startIndex, offsetBy: 3)
        
        let s0 = string.substring(with: r0)
        let s2 = string.substring(with:r2)
        

        string.replaceSubrange(r0, with: s2)
        string.replaceSubrange(r2, with: s0)

        return string.reverse()
    }
}


extension String{
    func reverse() -> String {
        
        var reverseString: String = ""
        
        for c in self.characters {
            reverseString.insert(c, at: reverseString.startIndex)
        }
        return reverseString
    }
    
    public static func asteriskProtection(string:String) -> String{
    
        var s = String(string)!

        if s.lengthOfBytes(using: .utf8) == 11 {
            
            let r0 = s.index(s.startIndex, offsetBy: 3) ..< s.index(s.startIndex, offsetBy: 7)

            
            s.replaceSubrange(r0, with: "****")
        }
        
        return s
    }
}

