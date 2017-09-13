//
//  ServiceSheet.swift
//  ttFinance
//
//  Created by LiuRex on 2017/8/17.
//  Copyright © 2017年 Shanghai Youyou Finance Information Technology Co.,Ltd. All rights reserved.
//

import UIKit

class ServiceSheet: UIView {
    
    var win: UIWindow?
    
    var nums:NSArray?
    var images:NSArray?
    
    convenience init() {
        self.init(frame: CGRect.zero)
        
        self.configSubviews()
    }
    
    
    func configSubviews() {
        
        self.backgroundColor = UIColor.white
        self.layer.cornerRadius = 10.0
        self.layer.masksToBounds = true
        
        nums = ["3251175668", "2957096294", "2640782936", "400-166-6788","取消"]
        images = ["QQ", "QQ", "QQ", "phone",""]
      
        let buttonHeight:CGFloat = 50

        let contentHeight = CGFloat(nums!.count) * buttonHeight

        self.frame = CGRect(origin: CGPoint.zero, size: CGSize(width: AppInformation.width - 80, height:contentHeight))

        nums?.enumerateObjects({ (num, idx, stop) in
            let imageName:String! = images!.object(at: idx) as! String
            let imageName_h:String! = imageName.appending("_h")
            let btn = UIButton(title: num as! String, titleColor: AppConstantColor.secondary, titleFont: AppConstantFont._16px, image:(UIImage(named: imageName)))
            self.addSubview(btn)
            btn.tag = idx
            btn.setImage(UIImage(named: imageName_h), for: .highlighted)
            btn.setTitleColor(AppConstantColor.main, for: .highlighted)
            
            
            
            btn.addTarget(self, action: #selector(self.btnAction(btn:)), for: UIControlEvents.touchUpInside)
            btn.snp.makeConstraints({ (make) in

                make.left.equalTo(self).offset(AppConstantMargin.level2)
                make.right.equalTo(self).offset(-AppConstantMargin.level2)
                make.height.equalTo(buttonHeight)
                make.top.equalTo(CGFloat(idx) * buttonHeight)
                
            })
            
            if (idx == nums!.count - 2) {
                
                btn.imageEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
                btn.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
                
            }else{
                btn.imageEdgeInsets = UIEdgeInsetsMake(0, -15, 0, 0);
                btn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
            }
            
            let line = UIView()
            line.backgroundColor = AppConstantColor.border
            btn.addSubview(line)
            line.snp.makeConstraints({ (make) in
                
                make.left.right.bottom.equalTo(btn)
                make.height.equalTo(0.5)
                
            })
        })
        
    }
    
    func btnAction(btn:UIButton) {
        self.dismiss()
        
        
        switch btn.tag {
        case 0,1,2:
            break;
        case 3:
            
            UIApplication.shared.openURL(URL(string: "telprompt:".appending(AppContactInformation.tel))!)
            
            break;
        default:
            break;
        }
        
    }
    
    
    public func show() {
        
        self.win = UIWindow(frame:UIScreen.main.bounds)
        self.win?.windowLevel = UIWindowLevelAlert
        self.win?.backgroundColor = UIColor.green
        self.win!.makeKeyAndVisible()
        self.win?.addSubview(self)
        self.center = self.win!.center
        let tapGes = UITapGestureRecognizer(target: self, action:#selector(dismiss))
        self.win?.addGestureRecognizer(tapGes)
        
        
    
        self.win!.backgroundColor = UIColor.clear
        self.transform = CGAffineTransform(translationX: 0, y: AppInformation.height);
        
        UIView.animate(withDuration: AppAnimationDuration.duration_25) {
            
            self.win?.backgroundColor = AppConstantColor.modal
            self.transform = CGAffineTransform.identity
        }
 
    }
    
    public func dismiss(){

        UIView.animate(withDuration: AppAnimationDuration.duration_25, animations: {
            self.transform = CGAffineTransform(translationX: 0, y: AppInformation.height);
            self.win?.alpha = 0;

        }) { (finished) in
            
            self.win?.resignKey()
            
        }
    }
}
