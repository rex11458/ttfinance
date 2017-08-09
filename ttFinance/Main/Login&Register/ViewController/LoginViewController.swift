//
//  LoginViewController.swift
//  ttFinance
//
//  Created by LiuRex on 17/4/21.
//  Copyright © 2017年 Shanghai Youyou Finance Information Technology Co.,Ltd. All rights reserved.
//

import UIKit

let LoginStoryBoard = UIStoryboard(name: "Login", bundle: Bundle.main)

class LoginViewController: UITableViewController {

    private var loginView: LoginView?
    
    @IBOutlet var phoneTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        ThemeStyle.sharedInstance.setStyle(style: .white)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        ThemeStyle.sharedInstance.setStyle(style: .default)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.configSubViews()
        
    }

    private func configSubViews() {
     
        loginView = LoginView()
      
        self.view.addSubview(loginView!)
    }
    
    private func login(phone:String?, password: String?){
      
        HUD.loading()
        HTTPService.sharedInstance.login(phone: phone!, password: password!) { (model) in
            
            guard let code = model.code,code == .code_0000 else{
            HUD.error(message: model.message)
                return
            }
            HUD.success(message: model.message)
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func loginAction(_ sender: Any) {
        
        let phone = phoneTextField.text
        let password = passwordTextField.text
        
        self.login(phone: phone, password: password)
        
    }
    
    @IBAction func dismissAction(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
}
