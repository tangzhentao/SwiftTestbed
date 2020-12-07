//
//  Team.swift
//  SwiftTestbed
//
//  Created by firefly on 2020/11/16.
//

import Foundation

struct Person: Codable {
    var id: Int
    var name: String
    var age: Int
    var isMale: Bool
}

struct Team: Codable {
    var master: Person
    var members: [Person]
}


