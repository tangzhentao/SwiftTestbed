//
//  NavigationController.swift
//  CloudBusiness
//
//  Created by firefly on 2020/10/26.
//

import UIKit

class NavigationController: UINavigationController {
    
    var mt: NavigationController.Type = NavigationController.self
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        viewController.hidesBottomBarWhenPushed = self.viewControllers.count > 0
        super.pushViewController(viewController, animated: animated)
        
    }
}
