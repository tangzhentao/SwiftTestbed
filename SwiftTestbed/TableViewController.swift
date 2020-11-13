//
//  TableViewController.swift
//  SwiftTestbed
//
//  Created by firefly on 2020/11/12.
//

import Foundation

import UIKit

class TableViewController: UITableViewController {
    
    fileprivate let cellReuseID = "cell"
    
    lazy var dataArray = [TestItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
        
        setupData()
        
        tableView.reloadData()
    }
    
    func configUI() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseID)
        tableView.tableFooterView = UIView()
    }
    
    func setupData() {
        dataArray = [
            TestItem(title: "元类型", type: MetatypeVC.self)
        ]
    }
}

extension TableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let testItem = dataArray[indexPath.row]
        
        let vc = testItem.type.init()
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}

extension TableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let testItem = dataArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseID, for: indexPath)
        cell.textLabel?.text = testItem.title
        return cell
    }
}