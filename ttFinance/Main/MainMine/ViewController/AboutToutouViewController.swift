//
//  AboutToutouViewController.swift
//  ttFinance
//
//  Created by LiuRex on 17/4/28.
//  Copyright © 2017年 Shanghai Youyou Finance Information Technology Co.,Ltd. All rights reserved.
//

import UIKit

private let sectionHeight: CGFloat = 10.0

class AboutToutouViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource,UIActionSheetDelegate {

    var tableView: UITableView?
    var dataArray: NSArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "关于投投"
    
        self.configData()
        
        self.configSubView()
        
        self.configHeaderFooterView()
    }

    func configData() {
        
        let filePath = Bundle.main.path(forResource: "AboutToutou", ofType: "plist")
        dataArray = NSArray(contentsOfFile: filePath!)
        
    }
    
    func configSubView() {
        
        tableView = UITableView(frame: self.view.bounds, style: .plain)
        tableView?.backgroundColor = AppConstantColor.block
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.register(MainMineViewCell.self, forCellReuseIdentifier: mainMineCellId)
        tableView?.separatorColor = AppConstantColor.border
        tableView?.separatorInset = UIEdgeInsets.zero
        tableView?.rowHeight = MainMineViewCellHeight
        self.view.addSubview(tableView!)
        tableView?.snp.makeConstraints({ (make) in
            make.edges.equalTo(self.view)
        })
    }
    
    func configHeaderFooterView() {
        
        let headerView = AboutToutouHeaderView(frame: CGRect(x: 0, y: 0, width: self.view.width, height: AboutToutouHeaderViewHeight))
        tableView?.tableHeaderView = headerView
        
        let footerView = AboutToutouFooterView(frame:  CGRect(x: 0, y: 0, width: self.view.width, height: AboutToutouFooterViewHeight))
        tableView?.tableFooterView = footerView
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataArray!.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let array:NSArray = (dataArray![section] as? NSArray)!
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:MainMineViewCell = tableView.dequeueReusableCell(withIdentifier: mainMineCellId) as! MainMineViewCell
        
        let array:NSArray = (dataArray![indexPath.section] as? NSArray)!
        cell.fill(item:(array[indexPath.row]) as! NSDictionary)
        cell.about(indexPath:indexPath)
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
        
        let array:NSArray = dataArray![indexPath.section] as! NSArray
        let item:NSDictionary = array[indexPath.row] as! NSDictionary
        let selString:String = item["action"] as! String
        
        let sel: Selector = NSSelectorFromString(selString)
        
        if self.responds(to: sel) {
            self.perform(sel)
        }
    }
    
    
    //tableViewCell selected IndexPath
    /*!
     *  了解投投
     */
    func aboutTT() {
    
        let url:String = AppStaticURL.abountToutou;
    
        let vc: WebViewController = WebViewController(url: url)
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    /*
     * 安全保障
     */
    func security(){
        
        let url:String = AppStaticURL.security
        
        let vc: WebViewController  = WebViewController(url: url)
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    /*
     *  常见问题
     */
    func commonProblems() {
        let url:String = AppStaticURL.question
        
        let vc: WebViewController  = WebViewController(url: url)
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    /*
     *  客户服务
     */
    func serviceTelephone() {
      
        let sheet  = ServiceSheet()
        
        sheet.show()
    }
}
