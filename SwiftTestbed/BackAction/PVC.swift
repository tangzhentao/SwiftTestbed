//
//  PVC.swift
//  SwiftTestbed
//
//  Created by itang on 2021/5/16.
//

import Foundation
import UIKit

class PVC: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "被弹出的控制器A"
        view.backgroundColor = .orange
        
        let btn = UIButton(frame: CGRect(origin: .zero, size: CGSize(width: 100, height: 60)))
        btn.addTarget(self, action: #selector(presentVC), for: .touchUpInside)
        btn.setTitle("present VC", for: .normal)
        btn.center = view.center
        btn.backgroundColor = .gray
        view.addSubview(btn)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.dismiss(animated: true) {
            print("PVC did dismiss")
        }
    }
    
    @objc func presentVC() {
        let vc = BaseViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}
