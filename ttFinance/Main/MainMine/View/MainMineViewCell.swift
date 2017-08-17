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
let accessoryKey = "accessoryKey"
let MainMineViewCellHeight: CGFloat = 56.0
class MainMineViewCell: BaseTableViewCell {
    
    private var leftImageView: UIImageView?
    private var titleLabel: UILabel?
    private var accessoryLabel: UILabel?
    private var arrowImageView: UIImageView?
    
    
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
        accessoryLabel = UILabel(textColor: AppConstantColor.secondary, font: AppConstantFont._14px)
        self.contentView.addSubview(accessoryLabel!)

        arrowImageView = UIImageView(image: #imageLiteral(resourceName: "new_cell_arrow"))
        self.contentView.addSubview(arrowImageView!)
        
        leftImageView?.snp.makeConstraints({ (make) in
            make.width.height.equalTo(26)
            make.left.equalTo(10)
            make.centerY.equalTo(self.contentView)
        })
        
        titleLabel?.snp.makeConstraints({ (make) in
            make.centerY.equalTo(self.contentView)
            make.left.equalTo((leftImageView?.snp.right)!).offset(10)
        })
        
        arrowImageView?.snp.makeConstraints({ (make) in
            make.centerY.equalTo(self.contentView)
            make.right.equalTo(self.contentView).offset(-10)
        })
        
        accessoryLabel?.snp.makeConstraints({ (make) in
            make.right.equalTo(arrowImageView!.snp.left).offset(-10)
            make.centerY.equalTo(self.contentView)
        })
        
        
    }
    
    public func fill(item: NSDictionary) {
        
        leftImageView?.image = UIImage(named: item.object(forKey: imageNameKey) as! String)
        titleLabel?.text = item.object(forKey: titleKey) as! String?
    }
    
    public func about(indexPath:IndexPath){
        
        var accessoryTitle:String = ""
        switch indexPath.row {
        case 3:
            accessoryTitle = "工作日 09:00-20:00"
            accessoryLabel?.textColor = AppConstantColor.important
            break;
        case 4:
            
            accessoryTitle = "www.66toutou.com"
            self.hiddenArrow(true)
            break;
        case 5:
            
            accessoryTitle = "toutoujinrong"
            self.hiddenArrow(true)
            
            break;
            
        default:
            self.hiddenArrow(false)
            accessoryLabel?.textColor = AppConstantColor.secondary
            break;
        }
    
    accessoryLabel?.text = accessoryTitle
    }
    
    
    public func hiddenArrow(_ hidden:Bool){
        
        arrowImageView?.isHidden = hidden
        
    }
    
}
