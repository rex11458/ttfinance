//
//  MainMineViewCell.swift
//  ttFinance
//
//  Created by LiuRex on 17/4/21.
//  Copyright © 2017年 Shanghai Youyou Finance Information Technology Co.,Ltd. All rights reserved.
//

import UIKit

let mainMineCellId = "mainMineCellId"

let titleKey = "title"
let imageNameKey = "imageName"
let MainMineViewCellHeight: CGFloat = 56.0
class MainMineViewCell: BaseTableViewCell {
    
    private var leftImageView: UIImageView?
    private var titleLabel: UILabel?
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = backgroundColor
        self .configSubView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configSubView() {
        
        leftImageView = UIImageView()
        self.contentView.addSubview(leftImageView!)
        titleLabel = UILabel(textColor:AppConstantColor.important, font: AppConstantFont._16px)
        self.contentView.addSubview(titleLabel!)

        leftImageView?.snp.makeConstraints({ (make) in
            make.width.height.equalTo(26)
            make.left.equalTo(10)
            make.centerY.equalTo(self.contentView)
        })
        
        titleLabel?.snp.makeConstraints({ (make) in
            make.centerY.equalTo(self.contentView)
            make.left.equalTo((leftImageView?.snp.right)!).offset(10)
        })
    }
    
    public func fill(indexPath: IndexPath,item: NSDictionary) {
        
        leftImageView?.image = UIImage(named: item.object(forKey: imageNameKey) as! String)
        titleLabel?.text = item.object(forKey: titleKey) as! String?
    }
}
