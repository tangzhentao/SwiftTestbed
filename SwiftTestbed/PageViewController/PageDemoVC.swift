//
//  PageDemoVC.swift
//  SwiftTestbed
//
//  Created by firefly on 2020/11/17.
//

import Foundation


import UIKit

class PageDemoVC: BaseViewController {
    var dataArray: [PageVC] = {
        let p1 = PageVC()
        p1.view.backgroundColor = UIColor.green
        let p2 = PageVC()
        p2.view.backgroundColor = UIColor.orange
        let p3 = PageVC()
        p3.view.backgroundColor = UIColor.blue
        
        return [p1, p2, p3]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let pagesVC = UIPageViewController.init(transitionStyle: UIPageViewController.TransitionStyle.scroll, navigationOrientation: UIPageViewController.NavigationOrientation.horizontal)
        pagesVC.delegate = self
        pagesVC.dataSource = self
        
        pagesVC.setViewControllers([dataArray[0]], direction: UIPageViewController.NavigationDirection.reverse, animated: false, completion: nil)
        
        pagesVC.view.frame = self.view.bounds
        
        self.addChild(pagesVC)
        self.view.addSubview(pagesVC.view)
    }
}

extension PageDemoVC: UIPageViewControllerDelegate {
    
}

extension PageDemoVC: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let index = dataArray.firstIndex(of: viewController as! PageVC)
        if index == 0 {
            return nil
        }
        
        return dataArray[index! - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let index = dataArray.firstIndex(of: viewController as! PageVC)
        if index == dataArray.count - 1 {
            return nil
        }
        
        return dataArray[index! + 1]
    }
    
}
