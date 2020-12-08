//
//  LazyObject.swift
//  SwiftTestbed
//
//  Created by firefly on 2020/11/13.
//

import Foundation

struct Object {
    var x = 1
    var y = 2
    var z = 3
}

struct LazyObject {
    lazy var x = 1
    lazy var y = 2
    lazy var z = 3
}

enum Week {
    case sunday
    case monday
    case tuesday(Int)
    case wednesday
    case thursday
    case friday
    case saturday
}


// 演示三种懒加载
struct LazyDemo {
    lazy var a = 1
    lazy var b = {
        ()->Int in
        print("lazy loading b")
        return 2 }() //
    lazy var c = generateC()
    
    func generateC() -> String {
        print("generate c")
        return "hello"
    }
}
