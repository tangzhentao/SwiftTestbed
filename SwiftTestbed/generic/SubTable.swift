//
//  SubTable.swift
//  SwiftTestbed
//
//  Created by firefly on 2020/12/8.
//

import Foundation

struct Model {
    var name = ""
    var age = 0
}

class SubTable: Table<Model> {
    func displayData() {
        for item in dataArray {
            print(item.age, item.name)
        }
    }
}
