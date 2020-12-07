//
//  ContainSearchBarVC.swift
//  SwiftTestbed
//
//  Created by itang on 2020/12/6.
//

import Foundation
import UIKit

class ContainSearchBarVC: BaseVC {
    
    var svc: UISearchController = {
        let rvc = SearchResultVC()
        let vc = UISearchController(searchResultsController: rvc)
        
        vc.hidesNavigationBarDuringPresentation = false
        vc.obscuresBackgroundDuringPresentation = false
        
        vc.searchResultsUpdater = rvc
        
        return vc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightGray
        addBarButtonItems()
        
        addSearchBar()
    }
    
    func addBarButtonItems() {
        let item = UIBarButtonItem(title: "发布", style: .plain, target: self, action: #selector(publish(sender:)))
        navigationItem.rightBarButtonItem = item
    }
    
    func addSearchBar() {
        
        
        
        let searchBar = svc.searchBar
        searchBar.delegate = self
        navigationItem.titleView = searchBar
    }
    
    @objc func publish(sender: UIBarButtonItem) {
        print("\(type(of: self)).\(#function)")

    }
}

extension ContainSearchBarVC: UISearchBarDelegate {
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        print("\(type(of: self)).\(#function)")
        navigationItem.rightBarButtonItem = nil
        return true
    }

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar){
        print("\(type(of: self)).\(#function)")
    }

    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        print("\(type(of: self)).\(#function)")
        return true

    }

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print("\(type(of: self)).\(#function)")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.addBarButtonItems()
        }
    }
}
