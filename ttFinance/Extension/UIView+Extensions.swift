//
//  UIView+Extensions.swift
//  ttFinance
//
//  Created by LiuRex on 17/4/21.
//  Copyright © 2017年 Shanghai Youyou Finance Information Technology Co.,Ltd. All rights reserved.
//

import UIKit

extension UIView {
    
    
    var size: CGSize {

        return self.bounds.size
    }
    
    var origin: CGPoint {
        return self.bounds.origin
    }
    
    var x: CGFloat {
        return self.origin.x
    }
    
    var y: CGFloat {
        return self.origin.y
    }
    
    var width: CGFloat {
        
        return self.size.width
    }

    var height: CGFloat {
        return self.size.height
    }
    
}
