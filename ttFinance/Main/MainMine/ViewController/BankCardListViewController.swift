//
//  BankCardListViewController.swift
//  ttFinance
//
//  Created by LiuRex on 17/5/2.
//  Copyright © 2017年 Shanghai Youyou Finance Information Technology Co.,Ltd. All rights reserved.
//

import UIKit

private let sectionHeight: CGFloat = 10.0

class BankCardListViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {

    var tableView: UITableView?
    var dataArray: NSArray?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "我的银行卡"
     
        
        self.configData()
        
        self.configSubView()
    }
    
    func configData() {
        
        
        let bankCard = UserManager.sharedInstance.user?.bankCard
        
        guard bankCard != nil else {
            return
        }
        
        dataArray =  [bankCard as Any]
        
    }
    
    func configSubView() {
        
        tableView = UITableView(frame: self.view.bounds, style: .plain)
        tableView?.backgroundColor = AppConstantColor.block
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.register(BankCardListViewCell.self, forCellReuseIdentifier: BankCardListCellId)
        tableView?.separatorColor = AppConstantColor.border
        tableView?.separatorInset = UIEdgeInsets.zero
        tableView?.rowHeight = BankCardListViewCellHeight
        tableView?.tableFooterView = UIView()
        self.view.addSubview(tableView!)
        tableView?.snp.makeConstraints({ (make) in
            make.edges.equalTo(self.view)
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return dataArray!.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:BankCardListViewCell = tableView.dequeueReusableCell(withIdentifier: BankCardListCellId) as! BankCardListViewCell
        
        let bankCard:BankCard = dataArray?.object(at: indexPath.row) as! BankCard
        cell.fill(bankCard)
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
    }
}
