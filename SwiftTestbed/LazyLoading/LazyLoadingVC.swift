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
    
        print("演示三种懒加载")
        var demo = LazyDemo()
        print("demo对象创建完成")
        print("第一次获取a:", demo.a)
        print("第一次获取b:", demo.b)
        print("第一次获取c:", demo.c)
        print("第二次获取a:", demo.a)
        print("第二次获取b:", demo.b)
        print("第二次获取c:", demo.c)
        
        print("end")
    }
    
}
