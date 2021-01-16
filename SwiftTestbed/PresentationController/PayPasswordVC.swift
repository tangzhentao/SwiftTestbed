//
//  PayPasswordVC.swift
//  SwiftTestbed
//
//  Created by firefly on 2021/1/16.
//

import Foundation
import UIKit


class PayPasswordVC: BaseViewController {
    
    var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(type(of: self)).\(#function)")
        creatUI()
        configUI()
        addUI()
        constraintUI()
    }
    
    func creatUI() {
        label = UILabel()
        
    }
    func configUI() {
        view.backgroundColor = .green
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
    }
    func addUI() {
        
    }
    func constraintUI() {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension PayPasswordVC: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        print("\(type(of: self)).\(#function)")
        let presentationVC = DimPresentationVC(presentedViewController: presented, presenting: presenting)
        return presentationVC
    }
}
