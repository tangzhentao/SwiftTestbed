//
//  BaseVC.swift
//  CloudBusiness
//
//  Created by firefly on 2020/10/27.
//

import UIKit

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.white
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        print("\(type(of: self)).\(#function)")
        if navigationController == nil && presentingViewController == nil {
            viewControllerDidDismiss()
        } else {
            print("ViewController does not dismiss")
        }
    }
    
    func viewControllerDidDismiss() {
        print("\(type(of: self)).\(#function)")
    }
    
}
