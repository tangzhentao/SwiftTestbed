//
//  WebviewVC.swift
//  SwiftTestbed
//
//  Created by firefly on 2020/12/31.
//

import Foundation
import WebKit


class WebviewVC: BaseViewController {
    var webView = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        creatUI()
        configUI()
        addUI()
        constraintUI()
        
        let url = URL(string: "https://www.baidu.com")
        let baidu = URLRequest(url: url!)
        webView.load(baidu)
    }
    
    func creatUI() {
        
    }
    func configUI() {
        webView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
    }
    func addUI() {
        view.addSubview(webView)
    }
    func constraintUI() {
        
    }
}
