//
//  SettingViewController.swift
//  ttFinance
//
//  Created by LiuRex on 17/4/27.
//  Copyright © 2017年 Shanghai Youyou Finance Information Technology Co.,Ltd. All rights reserved.
//

import UIKit

let kText = titleKey
let kImageName = imageNameKey
let kActionName = "actionName"
private let sectionHeight: CGFloat = 10.0

class SettingViewController: BaseViewController,UITableViewDataSource,UITableViewDelegate {

    var tableView: UITableView?
    var dataArray:NSMutableArray = NSMutableArray()
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "设置"
        self.view.backgroundColor = AppConstantColor.block
      
        self.configSubView()

        self.configData()
        
      }
    
    func configData(){

        let section00 = [
            [kText:"我的银行卡",kImageName:"new_wodeyinhangka",kActionName:"bankCardList"]
        ];
        
        let section0 = [
            [kText : "登录密码",kImageName:"new_denglumima",kActionName:"alertPassword"],
            [kText : "交易密码",kImageName:"new_jiaoyimima",kActionName:"bankCardList"],
            [kText : "手势密码",kImageName:"new_denglumima",kActionName:"bankCardList"],

        ]
        
        let section1 = [
            [kText:"客服服务",kImageName:"new_kehufuwu",kActionName:"bankCardList"]
        ]
        
         dataArray = NSMutableArray(object: section1)
    
        if UserManager.isLogin() {
            dataArray.insert(section00, at: 0)
            dataArray.insert(section0, at: 1)

            self.configHeaderFooterView()
        }
        
    }
    
    func configSubView() {
        
        tableView = UITableView(frame: self.view.bounds, style: .plain)
        tableView?.backgroundColor = AppConstantColor.block
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.sectionHeaderHeight = 10
        tableView?.rowHeight = 50
        tableView?.register(MainMineViewCell.self, forCellReuseIdentifier: mainMineCellId)
        tableView?.separatorColor = AppConstantColor.border
        tableView?.separatorInset = UIEdgeInsets.zero
        tableView?.rowHeight = MainMineViewCellHeight
        tableView?.tableFooterView = UIView()
        self.view.addSubview(tableView!)
        
    }
    
    func configHeaderFooterView() {
        
        let frame = CGRect(origin: .zero, size: CGSize(width:self.view.width, height: settingViewHeight))
        tableView?.tableHeaderView = SettingHeaderView(frame: frame)
        
       let rect = CGRect(x: 0, y: 0, width: self.view.width, height: 80)
        let footerView = UIView(frame:rect)
        let logoutButton:UIButton = UIButton.custom(title: "退出登录")
        logoutButton.frame = CGRect(x: 20, y: 20, width: self.view.width - 40, height: 40)
        logoutButton.addTarget(self, action: #selector(logout), for: .touchUpInside)
        footerView.addSubview(logoutButton)
        tableView?.tableFooterView = footerView
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        let array:NSArray = (dataArray[section] as? NSArray)!
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:MainMineViewCell = tableView.dequeueReusableCell(withIdentifier: mainMineCellId) as! MainMineViewCell

        let array:NSArray = (dataArray[indexPath.section] as? NSArray)!
        cell.fill(item:(array[indexPath.row]) as! NSDictionary)
        return cell
                
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return sectionHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let rect = CGRect(origin: CGPoint.zero, size: CGSize(width: tableView.bounds.size.width, height: sectionHeight))
        
        return UIView(frame: rect)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
  
        let array:NSArray = (dataArray[indexPath.section] as? NSArray)!
        let params = (array[indexPath.row]) as! NSDictionary
     
        let selString:String = params[kActionName] as! String
        
        let sel: Selector = NSSelectorFromString(selString)
        
        if self.responds(to: sel) {
            self.perform(sel)
        }

    }
    
    func bankCardList() {
        
        let isOpen: Bool = (UserManager.sharedInstance.user?.isOpen)!
        if isOpen {
            let vc = BankCardListViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func alertPassword() {
     
        let vc = LoginStoryBoard.instantiateViewController(withIdentifier: "AlertPasswordViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func logout() {
        HUD.loading()
        HTTPService.sharedInstance.logout { (model) in
            
            UserManager.sharedInstance.user = nil
            HUD.success(message: model.message)
            
           _ = self.navigationController?.popViewController(animated: true)
        }
    }
}
