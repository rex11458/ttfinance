//
//  MainMineHeaderView.swift
//  ttFinance
//
//  Created by LiuRex on 17/4/21.
//  Copyright © 2017年 Shanghai Youyou Finance Information Technology Co.,Ltd. All rights reserved.
//

import UIKit
import Kingfisher
let excessHeight: CGFloat = 124

let MainMineHeaderViewHeight: CGFloat = 196.0

protocol MainMineHeaderViewDelegate: NSObjectProtocol {
    
    func login()
    
}

class MainMineHeaderView: UIView {

    /*
     *  未登录
     */
    private var loginButton: UIButton?
    private var accessoryLabel: UILabel?
    
    /*
     *  已登录
     */
    private var headerImageView:UIImageView?
    private var nameLabel:UILabel?
    private var editButton:UIButton?
    private var signatureLabel:UILabel?
    private var isRealButton:UIButton?
    private var arrowImageView:UIImageView?
    
    var delegate:MainMineHeaderViewDelegate?
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        self.backgroundColor = backgroundColor
    
        self.configSubViews()
        self.refresh()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configSubViews() {
    
        let image = #imageLiteral(resourceName: "me_header_bg")
        let bgImageView:UIImageView = UIImageView(image: image)
        bgImageView.contentMode = .scaleToFill
        self.addSubview(bgImageView)
        
        loginButton = UIButton(title: "注册/登录",redius:5,borderWidth:0.5,borderColor:.white)
        loginButton?.addTarget(self, action: #selector(self.loginAction), for: .touchUpInside)
        self.addSubview(loginButton!)
        
        accessoryLabel = UILabel(text:"~登录后可享更多福利~",textColor:.white,font:AppConstantFont._14px)
        accessoryLabel?.textAlignment = .center
        self.addSubview(accessoryLabel!)
        
        accessoryLabel?.snp.makeConstraints({ (make) in
            make.centerX.equalTo(self)
            make.bottom.equalTo(-30)
        })
        
        loginButton?.snp.makeConstraints({ (make) in
            make.width.equalTo(109)
            make.height.equalTo(38)
            make.centerX.equalTo(self)
            make.bottom.equalTo((accessoryLabel?.snp.top)!).offset(-20)
        })
        
        bgImageView.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsetsMake(-excessHeight, 0, 0, 0))
        }
        
        let headerImage = #imageLiteral(resourceName: "defult_user_icon")
        let headerImageHeight:CGFloat = 80.0
        headerImageView = UIImageView(image:headerImage)
        headerImageView?.layer.cornerRadius = headerImageHeight * 0.5
        headerImageView?.layer.masksToBounds = true
        headerImageView?.layer.borderWidth = 2.0
        headerImageView?.layer.borderColor = UIColor.white.cgColor
        self.addSubview(headerImageView!)
        
        nameLabel = UILabel(textColor: UIColor.white, font: AppConstantFont._18px)
        self.addSubview(nameLabel!)
        
        editButton = UIButton(image: #imageLiteral(resourceName: "edit"))
        self.addSubview(editButton!)
        
        
        signatureLabel = UILabel(textColor: UIColor.white, font: AppConstantFont._14px)
        self.addSubview(signatureLabel!)
        
        isRealButton = UIButton()
        isRealButton?.tintColor = UIColor.clear
        isRealButton?.isUserInteractionEnabled = false
        isRealButton?.setImage(#imageLiteral(resourceName: "no_real_name"), for: .normal)
        isRealButton?.setImage(#imageLiteral(resourceName: "real_name"), for: .selected)
        self.addSubview(isRealButton!)
        
        arrowImageView = UIImageView(image: #imageLiteral(resourceName: "arrow_white"))
            self.addSubview(arrowImageView!)
        
        headerImageView?.snp.makeConstraints({ (make) in
            
            make.left.equalTo(15)
            make.bottom.equalTo(-30)
            make.width.height.equalTo(headerImageHeight)
        })
        
        
      
        nameLabel?.snp.makeConstraints({ (make) in
            
            make.top.equalTo(headerImageView!)
            make.left.equalTo(headerImageView!.snp.right).offset(15)
      
        })
        
        editButton?.snp.makeConstraints({ (make) in
            
            make.centerY.equalTo(nameLabel!).offset(-2);
            make.left.equalTo(nameLabel!.snp.right);
            make.width.height.equalTo(30);
        })
        
        signatureLabel?.snp.makeConstraints({ (make) in
            make.left.equalTo(nameLabel!)
            make.right.equalTo(arrowImageView!).offset(-10)
            make.top.equalTo(nameLabel!.snp.bottom).offset(5)
        })
        
        
        isRealButton?.snp.makeConstraints({ (make) in
            make.left.equalTo(nameLabel!)
            make.top.equalTo(signatureLabel!.snp.bottom).offset(5)
        })
        
        arrowImageView?.snp.makeConstraints({ (make) in
            make.right.equalTo(-20)
            make.centerY.equalTo(headerImageView!)
        })
    }
    
    func loginAction() {
        
        if (delegate != nil) && (delegate?.responds(to: Selector(("login"))))! {
            delegate?.login()
        }
        
    }
    
    public func didScroll(scrollView:UIScrollView) {
        
        let offsetY = scrollView.contentOffset.y
        
        if offsetY < -excessHeight {
            scrollView.contentOffset = CGPoint(x: 0, y: -excessHeight)
        }
    }
    
    public func refresh() {
        let isLogin = UserManager.isLogin()
        loginButton?.isHidden = isLogin
        accessoryLabel?.isHidden = isLogin
        
        headerImageView?.isHidden = !isLogin
        nameLabel?.isHidden = !isLogin
        isRealButton?.isHidden = !isLogin
        arrowImageView?.isHidden = !isLogin
        editButton?.isHidden = !isLogin
        signatureLabel?.isHidden = !isLogin
        let user = UserManager.sharedInstance.user
      
        if user != nil {
            isRealButton?.isSelected = (user?.isOpen)!
            nameLabel?.text = String.check(user?.name)
            signatureLabel?.text = String.check(user?.signature)
            let imageUrl = URL(string: String.check(user?.portrait))
            
            headerImageView?.kf.setImage(with: imageUrl,placeholder:#imageLiteral(resourceName: "defult_user_icon"))
        }
    }
}
