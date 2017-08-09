//
//  WebViewController.swift
//  ttFinance
//
//  Created by LiuRex on 17/4/28.
//  Copyright © 2017年 Shanghai Youyou Finance Information Technology Co.,Ltd. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: BaseViewController,WKNavigationDelegate,WKScriptMessageHandler {

    var webView:WKWebView?
    var url:String?
    
   convenience init(url:String) {
        self.init()
        self.url = url
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let userCC: WKUserContentController = WKUserContentController()
        userCC.add(self, name: "showAge")
        userCC.add(self, name: "showName")
        userCC.add(self, name: "showInfo")

        
        let config = WKWebViewConfiguration()
        config.preferences.minimumFontSize = 18
        
        config.userContentController = userCC
        webView = WKWebView(frame: self.view.bounds, configuration:config)
        webView?.navigationDelegate = self

        webView?.autoresizingMask = .flexibleTopMargin
        self.view.addSubview(webView!)
        
        self.loadRequest()
    }
    
    func loadRequest() {
    
        let url = URL(string: String.check(self.url))
        
        guard url != nil else {
            return
        }
        
        let request:URLRequest = URLRequest(url: url!)
      
       _ = webView?.load(request)
    }
    
    //WKNavigationDelegate
    
    public func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        
        
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
    
        
    }
    
    /*! @abstract Invoked when a main frame navigation completes.
     @param webView The web view invoking the delegate method.
     @param navigation The navigation.
     */
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        webView.evaluateJavaScript("document.title") { (title, error) in
            
            self.navigationItem.title = title as? String
            
        }
        
    }
    
    
    /*! @abstract Invoked when an error occurs during a committed main frame
     navigation.
     @param webView The web view invoking the delegate method.
     @param navigation The navigation.
     @param error The error that occurred.
     */
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        
    }
    
    
     func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        
        let sel = NSSelectorFromString(message.name.appending(":"))
        let param = message.body
        if self.responds(to: sel) {
            self.perform(sel, with: param)
        }
        
    }
    
    func showName() {
        
    }
    
    func showAge() {
      
        
    }
    
    func showInfo(_ param:Any) {
        
    }
    
}



