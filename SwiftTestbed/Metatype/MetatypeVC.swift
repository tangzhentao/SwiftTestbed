//
//  MetatypeVC.swift
//  SwiftTestbed
//
//  Created by firefly on 2020/11/13.
//

import UIKit

class MetatypeVC: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        test()
    }
    
    func test() {
        print(type(of: self))
        print(type(of: MetatypeVC.self))
        
        let smiley = EmojiSmiley()
        printSmileyInfo(smiley)
        
        let intMetaType: Int.Type = Int.self
        let protocolMetaType: SomeProtocol.Protocol = SomeProtocol.self
        print("类型的元类型:", intMetaType) // Int
        print("协议的元类型:", protocolMetaType) // SomeProtocol
        
        print("可以使用元类型的实例来调用类型的静态方法")
        print(intMetaType.init(10)) // 10

        
        print("打印为协议类型")
        let s: SomeProtocol = "hello"
        printGenericInfo(s) // meta type: SomeProtocol
        
        print("打印为真实类型")
        betterPrintGenericInfo(s) // meta type: String
        
        String.someFunc()
        String.self.someFunc()
        type(of: "hello").someFunc()
    }
    
    func printSmileyInfo(_ value: Smiley) {
        let smileyType = type(of: value) // 通过类的对象获取类的元类型的实例
        print("print type:", smileyType)
        print("value type:", smileyType.text)
        print("value type:", Smiley.self.text) // 通过类名获取类的元类型的实例
        
        
    }
    
    func printGenericInfo<T>(_ value: T) {
        let metaType = type(of:value)
        print("meta type:", metaType)
    }
    func betterPrintGenericInfo<T>(_ value: T) {
        let metaType = type(of:value as Any)
        print("meta type:", metaType)
    }
    
}

protocol SomeProtocol {
    static func someFunc()
}
extension String: SomeProtocol {
    static func someFunc () {
        print("some func")
    }
}
