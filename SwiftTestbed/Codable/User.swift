//
//  User.swift
//  SwiftTestbed
//
//  Created by firefly on 2020/11/16.
//

import Foundation


// 归档 必须继承NSObject
struct User: Codable {
    var id = 1001
    var isMale = true
    var name: String
    var age: Int
    var money: Double
    var des = ""
}

extension User {
    enum CodingKeys: String, CodingKey {
        case id
        case isMale = "is_male"
        case name
        case age
        case money
    }
}
