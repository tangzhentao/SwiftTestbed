//
//  CollectionViewVC.swift
//  SwiftTestbed
//
//  Created by firefly on 2020/11/23.
//

import Foundation

import UIKit

class CollectionViewVC: BaseViewController {
    
    // 三个button、一个collectionView
    
    var twoLevelCollectionView: UICollectionView!
    var collectionViewLayout: UICollectionViewLayout!
    
    let tableViewReuseID = "UITableViewCell"
    let collectionViewReuseID = "UICollectionViewCell"
    let headerReuseID = "headerReuseID"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        creatUI()
        configUI()
        addUI()
        constraintUI()
        
    }
    
    // MARK: - UI 初步
    func creatUI() {
        collectionViewLayout = UICollectionViewFlowLayout()
//        collectionViewLayout.
        twoLevelCollectionView = UICollectionView(frame: view.bounds, collectionViewLayout: collectionViewLayout)
    }
    func configUI() {
        configCollectionView()
    }
    func addUI() {
        view.addSubview(twoLevelCollectionView)
    }
    func constraintUI() {
        
    }
    
    // MARK: 细化
    func configCollectionView() {
//        twoLevelCollectionView.backgroundColor = UIColor.lightGray
        twoLevelCollectionView.delegate = self
        twoLevelCollectionView.dataSource = self
        twoLevelCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: collectionViewReuseID)
        
        twoLevelCollectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerReuseID")
    }
}

// MARK: - collection view delegate
extension CollectionViewVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionViewReuseID, for: indexPath)
        cell.contentView.backgroundColor = UIColor.gray
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerReuseID, for: indexPath)
        header.backgroundColor = UIColor.red
        return header
    }
}
//extension CollectionViewVC: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 60, height: 40)
//    }
//}
