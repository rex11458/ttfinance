//
//  UUNavigationController.swift
//  ttFinance
//
//  Created by LiuRex on 17/4/20.
//  Copyright © 2017年 Shanghai Youyou Finance Information Technology Co.,Ltd. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController,UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
    }

    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
    
        let transparent:Bool = viewController.isMember(of: MainMineViewController.self)
        let color = transparent ? UIColor.clear : AppConstantColor.main
        self.navigationBar.backgroundColor = color
    
    }
}
