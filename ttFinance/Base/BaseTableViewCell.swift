//
//  BaseTableViewCell.swift
//  ttFinance
//
//  Created by LiuRex on 17/4/21.
//  Copyright © 2017年 Shanghai Youyou Finance Information Technology Co.,Ltd. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {

    var selectedImageView: UIImageView?
    
      override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSelectedView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        addSelectedView()
    }
    
    func addSelectedView() {
        
        selectedImageView = UIImageView.init(image: AppConstantColor.selected.image)
        self.selectedBackgroundView = selectedImageView
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        selectedImageView?.frame = self.bounds
    }
}
