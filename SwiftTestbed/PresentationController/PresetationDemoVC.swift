//
//  PresetationDemoVC.swift
//  SwiftTestbed
//
//  Created by firefly on 2021/1/16.
//

import Foundation
import UIKit

class PresetationDemoVC: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        creatUI()
        configUI()
        addUI()
        constraintUI()
    }
    
    func creatUI() {
        
    }
    func configUI() {
        
    }
    func addUI() {
        
    }
    func constraintUI() {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let vc = PayPasswordVC()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .custom
        vc.transitioningDelegate = vc
        self.present(vc, animated: true, completion: nil)
    }
}
