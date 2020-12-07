//
//  SearchResultVC.swift
//  SwiftTestbed
//
//  Created by itang on 2020/12/6.
//

import Foundation

class SearchResultVC: BaseVC, UISearchResultsUpdating {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.orange
        
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        print("\(type(of: self)).\(#function)")
        let frame = searchController.view.frame
        let newFrame = CGRect(x: 0, y: 100, width: frame.width, height: frame.height - 100)
        view.frame = newFrame
        view.isHidden = false
    }
}
