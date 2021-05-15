//
//  LazyLoadingVC.swift
//  SwiftTestbed
//
//  Created by firefly on 2020/11/13.
//

import Foundation

import UIKit

class LazyLoadingVC: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var lazyObject = LazyObject()
        var object = Object()
        
        title = "懒加载"
        if #available(iOS 11, *) {
            navigationItem.backButtonTitle = ""
        }
        
        print("object内存结构")
        print(MemoryLayout.size(ofValue: object))
        print(MemoryLayout.alignment(ofValue: object))
        print(MemoryLayout.stride(ofValue: object))
        print("lazyObject内存结构")
        print(MemoryLayout.size(ofValue: lazyObject))
        print(MemoryLayout.alignment(ofValue: lazyObject))
        print(MemoryLayout.stride(ofValue: lazyObject))
    
        print("lazyObject:", lazyObject)
        print("x:", lazyObject.x)
        print("y:", lazyObject.y)
        print("z:", lazyObject.z)
        
        print("lazyObject.z type:", type(of: lazyObject.z))
        print("lazyObject内存结构")
        print(MemoryLayout.size(ofValue: lazyObject))
        print(MemoryLayout.alignment(ofValue: lazyObject))
        print(MemoryLayout.stride(ofValue: lazyObject))
        
        print("end")
    }
    
}
