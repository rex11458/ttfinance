//
//  MainMineViewController.swift
//  ttFinance
//
//  Created by LiuRex on 17/4/20.
//  Copyright © 2017年 Shanghai Youyou Finance Information Technology Co.,Ltd. All rights reserved.
//

import UIKit


private let sectionHeight: CGFloat = 10.0

class MainMineViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource,MainMineHeaderViewDelegate,UINavigationControllerDelegate {

    private var headerView: MainMineHeaderView?
    
    private var tableView: UITableView?
    
    var dataArray: NSArray?
    
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false;

        configData()
        
        configNavigation()
        configSubViews()
        configHeaderFooterView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        loadBasicUserInfo()
        
        self.scrollViewDidScroll(tableView!)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        self.navigationController?.navigationBar.backgroundColor = AppConstantColor.main

    }
    
    private func configData() {
        let path = Bundle.main.path(forResource: "MainMine", ofType: "plist")
        dataArray = NSArray(contentsOfFile: path!)
    }
    
    
    private func configNavigation(){
        
        let leftImage: UIImage = #imageLiteral(resourceName: "new_set")
        let leftBarItem = UIBarButtonItem(image: leftImage, style: .plain, target: self, action: #selector(self.setting))
        leftBarItem.tintColor = UIColor.white
        self.navigationItem.leftBarButtonItem = leftBarItem
        
        let rightImage = #imageLiteral(resourceName: "new_message")
        let rightBarItem = UIBarButtonItem(image: rightImage, style: .plain, target: self, action: #selector(self.setting))
        rightBarItem.tintColor = UIColor.white
        self.navigationItem.rightBarButtonItem = rightBarItem
    }

    
    @objc private func setting(){
        
        let vc:SettingViewController = SettingViewController()
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    private func configSubViews() {

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
        
        headerView = MainMineHeaderView(frame: CGRect(x: 0, y: 0, width: (tableView?.width)!, height: MainMineHeaderViewHeight))
        headerView?.delegate = self
        tableView?.tableHeaderView = headerView
        
        let footerView = UIView(frame:CGRect(x: 0, y: 0, width: self.view.width, height: AppConstantHeight.button))
        let logoButton = UIButton(title: "简单理财  投投有道", titleColor: AppConstantColor.secondary, titleFont: AppConstantFont._12px, image: #imageLiteral(resourceName: "toutou_logo"))
        logoButton.contentHorizontalAlignment = .center;
        logoButton.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        logoButton.isUserInteractionEnabled = false
        footerView.addSubview(logoButton)
        logoButton.snp.makeConstraints { (make) in
            make.edges.equalTo(footerView)
        }
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
        tableView .deselectRow(at: indexPath, animated: true)
        
        let array:NSArray = dataArray![indexPath.section] as! NSArray
        let item:NSDictionary = array[indexPath.row] as! NSDictionary
        let selString:String = item["action"] as! String
        
        let sel: Selector = NSSelectorFromString(selString)
        
        if self.responds(to: sel) {
            self.perform(sel)
        }
    }
    
    
    func loadBasicUserInfo() {
        
        HTTPService.sharedInstance.userBasicInformation { (model) in
         
            self.headerView?.refresh()
            
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        headerView?.didScroll(scrollView: scrollView)

        var alpha: CGFloat = 0
        
        let navbarChangeY: CGFloat = 60.0
        
        let offsetY = scrollView.contentOffset.y
        
        if offsetY > navbarChangeY {
             alpha = 1 - ((navbarChangeY + 64 - offsetY) / 64);
        }
        self.navigationController?.navigationBar.backgroundColor = AppConstantColor.main.withAlphaComponent(alpha)

    }

    func login() {
        
    
        let vc = LoginStoryBoard.instantiateInitialViewController()
        
        self.present(vc!, animated: true, completion: nil)
    }
    
    
    /*!
     *  关于投投
     */
    func aboutTT()
    {
        let vc = AboutToutouViewController()
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
