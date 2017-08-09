//
//  AboutToutouFooterView.swift
//  ttFinance
//
//  Created by LiuRex on 17/4/28.
//  Copyright © 2017年 Shanghai Youyou Finance Information Technology Co.,Ltd. All rights reserved.
//

import UIKit

let AboutToutouFooterViewHeight:CGFloat = 100.0

class AboutToutouFooterView: UIView {
    
   override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = AppConstantColor.block
        self.configSubView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    func configSubView() {
        
        let label = UILabel(textColor: AppConstantColor.secondary, font: AppConstantFont._14px)
        label.numberOfLines = 0
        label.textAlignment = .center
        self.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
        
        let calendar = Calendar.current
        
        let dataComponent:DateComponents = calendar.dateComponents([Calendar.Component.year], from: Date())
        
        let string:String = String(format: "证监会核准机构(联泰资产)提供基金销售服务\n%zd©版权信息", dataComponent.year!)
        label.text = string
    }
}
