//
//  AboutToutouHeaderView.swift
//  ttFinance
//
//  Created by LiuRex on 17/4/28.
//  Copyright © 2017年 Shanghai Youyou Finance Information Technology Co.,Ltd. All rights reserved.
//

import UIKit


let AboutToutouHeaderViewHeight:CGFloat = 150.0

class AboutToutouHeaderView: UIView {

    
   override init(frame: CGRect) {
        super.init(frame: frame)
    self.backgroundColor = .white
    
    self.configSubView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configSubView() {
        
        let imageView:UIImageView = UIImageView(image: #imageLiteral(resourceName: "about_tt"))
        self.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            
            make.centerX.equalTo(self)
            make.centerY.equalTo(self).offset(-AppConstantMargin.level1)
            make.size.equalTo(#imageLiteral(resourceName: "about_tt").size)
        }
        
        let s = String(format: "当前版本号 V%@", AppInformation.appVersion)
        let label: UILabel = UILabel(text: s, textColor:AppConstantColor.secondary, font: AppConstantFont._12px)
        label.textAlignment = .center
        self.addSubview(label)
        label.snp.makeConstraints { (make) in
            
            make.top.equalTo(imageView.snp.bottom).offset(AppConstantMargin.level2)
            make.centerX.equalTo(self)
            
            
        }
    }
}
