//
//  UUViewController.swift
//  ttFinance
//
//  Created by LiuRex on 17/4/20.
//  Copyright © 2017年 Shanghai Youyou Finance Information Technology Co.,Ltd. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        ThemeStyle.sharedInstance.setStyle(style: .default)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.edgesForExtendedLayout = UIRectEdge(rawValue: 0)

      let barbutton = UIBarButtonItem()
        barbutton.title = ""
        self.navigationItem.backBarButtonItem = barbutton;
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


extension UIViewController{
    func configTabbarItem(title:String,imageName:String) {
        self.tabBarItem.title = title
        
        self.tabBarItem.image = (UIImage(named: imageName))?.withRenderingMode(.alwaysOriginal)
        
        self.tabBarItem.selectedImage = (UIImage(named:"\(imageName)_selected"))?.withRenderingMode(.alwaysOriginal)
    }
}
