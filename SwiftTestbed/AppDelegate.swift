//
//  AppDelegate.swift
//  SwiftTestbed
//
//  Created by firefly on 2020/11/12.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor.white
        
        let tvc = TableViewController()
        let nvc = NavigationController(rootViewController: tvc)
        self.window?.rootViewController = nvc
        self.window?.makeKeyAndVisible()
        
        return true
    }
}

