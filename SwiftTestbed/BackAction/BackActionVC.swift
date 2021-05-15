//
//  File.swift
//  SwiftTestbed
//
//  Created by itang on 2021/5/15.
//

import Foundation
import UIKit

/*
 目标：
 1、感知 ViewController 已经dismiss了
 2、感知 ViewController 的返回按钮被点击了，然后决定是否要pop
 
 显示：
 1、在viewDidDisappear(_ animated:)中实现
 2、
 */
class BackActionVC: BaseViewController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        navigationController?.pushViewController(UIViewController(), animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let popBarBtn = UIBarButtonItem(title: "pop", style: .plain, target: self, action: #selector(pop))
        let presentBarBtn = UIBarButtonItem(title: "present", style: .plain, target: self, action: #selector(presentVC))

        navigationItem.rightBarButtonItems = [popBarBtn, presentBarBtn]

        
        // 自定义左侧按钮后，视图控制器的返回手势就失效了
//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "back", style: .plain, target: self, action: #selector(pop))

    }
    
    @objc func pop() {
        /*
         pop vc时，不会触发navigationBar(_:shouldPop:)
         右滑返回视图控制器时，不会触发navigationBar(_:shouldPop:)
         */
        navigationController?.popViewController(animated: true)
    }
    @objc func presentVC() {
        /*
         pop vc时，不会触发navigationBar(_:shouldPop:)
         右滑返回视图控制器时，不会触发navigationBar(_:shouldPop:)
         */
        let vc = PVC()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
}
