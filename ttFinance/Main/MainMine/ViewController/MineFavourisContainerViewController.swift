//
//  MineFavourisViewController.swift
//  ttFinance
//
//  Created by LiuRex on 2017/9/1.
//  Copyright © 2017年 Shanghai Youyou Finance Information Technology Co.,Ltd. All rights reserved.
//

import UIKit

class MineFavourisContainerViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "我的自选"
        
        let pageViewController:PageViewController = PageViewController()

        
        let vc1 = MineFavouriseViewController()
        let vc2 = MineFavouriseViewController()
        pageViewController.viewControllers = [vc1, vc2]
        pageViewController.titles = ["非货币基金","货币基金"]
        
        self.view.addSubview(pageViewController.view)
        self.addChildViewController(pageViewController)
  
        
        pageViewController.view.snp.makeConstraints { (make) in
            
            make.edges.equalTo(self.view)
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
