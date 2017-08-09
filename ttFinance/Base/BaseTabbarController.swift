//
//  UUTabbarController.swift
//  ttFinance
//
//  Created by LiuRex on 17/4/20.
//  Copyright © 2017年 Shanghai Youyou Finance Information Technology Co.,Ltd. All rights reserved.
//

import UIKit

class BaseTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addViewControllers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    private func addViewControllers(){
     
        let productVc:MainProductViewController = MainProductViewController()
        let talentoVc:MainTalentViewController = MainTalentViewController()
        let holdingsVc:MainHoldingsViewController = MainHoldingsViewController()
        let mineVc:MainMineViewController = MainMineViewController()
        
        let nav0 = BaseNavigationController(rootViewController: productVc)
        let nav1 = BaseNavigationController(rootViewController: talentoVc)
        let nav2 = BaseNavigationController(rootViewController: holdingsVc)
        let nav3 = BaseNavigationController(rootViewController: mineVc)

        self.viewControllers = [nav0,nav1,nav2,nav3];
      
        nav0.configTabbarItem(title: "投什么", imageName: "Tabbar_tt")
        nav1.configTabbarItem(title: "找达人", imageName: "Tabbar_gh")
        nav2.configTabbarItem(title: "看收益", imageName: "Tabbar_lhb")
        nav3.configTabbarItem(title: "我", imageName: "Tabbar_me")
        
        ThemeStyle.sharedInstance.customAppearance()
    }
}


