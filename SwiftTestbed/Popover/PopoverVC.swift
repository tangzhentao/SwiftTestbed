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
    let items = IteamsVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addBarButtonItems()
        
        addButton()
        
    }
    
    func addBarButtonItems() {
        navigationItem.rightBarButtonItem = addItem
    }
    func addButton() {
        btn = UIButton(frame: CGRect(x: 60, y: 100, width: 100, height: 60))
        btn.addTarget(self, action: #selector(popButton), for: UIControl.Event.touchUpInside)
        btn.backgroundColor = UIColor.green
        view.addSubview(btn)
        
        items.preferredContentSize = CGSize(width: 80, height: 160)
        items.modalPresentationStyle = .popover
        
        
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
    
    @objc func popButton() {
        print("\(type(of: self)).\(#function)")
        
        let pop = items.popoverPresentationController
        pop?.delegate = self
        pop?.sourceView = btn
                
        self.present(items, animated: true, completion: nil)
    }
    
    
}

extension PopoverVC: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}


