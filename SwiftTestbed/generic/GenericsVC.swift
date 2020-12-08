//
//  GenericsVC.swift
//  SwiftTestbed
//
//  Created by firefly on 2020/12/8.
//

import Foundation

class GenericsVC: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let subTable = SubTable()
        for i in 1...5 {
            subTable.dataArray.append(Model(name: "jobs", age: i))
        }
        subTable.displayData()
    }
}
