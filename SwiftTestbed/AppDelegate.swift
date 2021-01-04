//
//  AppDelegate.swift
//  SwiftTestbed
//
//  Created by firefly on 2020/11/12.
//

import UIKit

@main
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
        
        printItems()
        
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        // file:///private/var/mobile/Containers/Data/Application/63B17B7E-1C80-4B65-B3A2-459579FD6D7D/Documents/Inbox/test-1.txt
        // path: /var/mobile/Containers/Data/Application/D0E5544D-DD36-46D0-9C92-5C051870A95E/Documents/user
        
        print("in file:", url.absoluteString)
        
        return true
    }
    
    func printItems() {
        let homePath = NSHomeDirectory()
        let docPath = homePath + "/Documents"
        let path = docPath + "/Inbox/test"
        
        let enumerator = FileManager.default.enumerator(atPath: path)
        while let item = enumerator?.nextObject() as? String {
            print(item)
        }
    }
    
    static let path: String = {
        let homePath = NSHomeDirectory()
        let docPath = homePath + "/Documents"
        let userPath = docPath + "/user"
        
        return userPath
    }()
}

