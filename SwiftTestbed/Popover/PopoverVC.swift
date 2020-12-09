//
//  PopoverVC.swift
//  SwiftTestbed
//
//  Created by firefly on 2020/12/8.
//

import Foundation
import UIKit

class PopoverVC: BaseViewController {
    
    lazy var addItem: UIBarButtonItem = {
        let item = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add))
        return item
    }()
    
    var btn: UIButton!
    var items: IteamsVC!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addBarButtonItems()
        
        addButton()
        
    }
    
    func addBarButtonItems() {
        navigationItem.rightBarButtonItem = addItem
    }
    
    func addPopover() {
        let items = IteamsVC()
        items.preferredContentSize = CGSize(width: 80, height: 160)
        items.modalPresentationStyle = .popover
        
        let pop = items.popoverPresentationController
        pop?.delegate = self
        pop?.barButtonItem = addItem
        
        self.present(items, animated: true, completion: nil)
        
    }
    
    @objc func add() {
        print("\(type(of: self)).\(#function)")
        
        addPopover()
    }
    
    func addButton() {
        btn = UIButton(frame: CGRect(x: 60, y: 100, width: 100, height: 60))
        btn.addTarget(self, action: #selector(popButton), for: UIControl.Event.touchUpInside)
        btn.backgroundColor = UIColor.green
        view.addSubview(btn)
        
        // 创建vc
        items = IteamsVC()
        // 设置弹出框的大小
        items.preferredContentSize = CGSize(width: 80, height: 160)
        // 设置显示的样式为弹出框
        items.modalPresentationStyle = .popover
    }
    
    @objc func popButton() {
        print("\(type(of: self)).\(#function)")
        
        // 获取vc的展示vc 并 设置该展示vc
        let pop = items.popoverPresentationController
        pop?.delegate = self
        pop?.sourceView = btn
        pop?.sourceRect = CGRect(x: 90, y: 50, width: 10, height: 10)
        pop?.backgroundColor = UIColor.orange
        print(pop?.popoverLayoutMargins as Any)
        // 显示vc
        self.present(items, animated: true, completion: nil)
    }
    
    
}

// 提供该方法，则不能呈现弹出框样式
extension PopoverVC: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}


