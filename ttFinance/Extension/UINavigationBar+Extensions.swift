//
//  UINavigationBar+Extensions.swift
//  ttFinance
//
//  Created by LiuRex on 17/4/27.
//  Copyright © 2017年 Shanghai Youyou Finance Information Technology Co.,Ltd. All rights reserved.
//

import UIKit

extension UINavigationBar {


    open override class func initialize(){
        
       
        let originalSelector = #selector(setter: UINavigationBar.backgroundColor)
        let swizzledSelector = #selector(UINavigationBar.uu_setBackgroundColor(_:))
        
        let originalMethod = class_getInstanceMethod(self, originalSelector)
        let swizzledMethod = class_getInstanceMethod(self, swizzledSelector)
        
        let didAddMethod = class_addMethod(self, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))
        
        if didAddMethod {
            class_replaceMethod(self, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    }
    


    private struct AssociatedKeys {
        static var backgroundView = "backgroundView"
    }
    
    func uu_setBackgroundColor(_ color:UIColor) {

        var view = objc_getAssociatedObject(self, &AssociatedKeys.backgroundView) as? UIView
        
        if view == nil {
            view = UIView()
            objc_setAssociatedObject(self, &AssociatedKeys.backgroundView, view, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        view?.backgroundColor = color
        
        self.setValue(view, forKey: AssociatedKeys.backgroundView)
        
    }
}
