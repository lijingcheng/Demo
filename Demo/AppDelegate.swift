//
//  AppDelegate.swift
//  Demo
//
//  Created by 李京城 on 2020/9/15.
//  Copyright © 2020 X. All rights reserved.
//

import UIKit
import Framework
import ModuleA
import ModuleB

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    lazy var tabBarController: UITabBarController = {
        let tabBarController = UITabBarController()
        
        let moduleAVC = RouterService.viewControllerWithClassName("ModuleAViewController", storyboard: "ModuleA", bundle: Bundle.moduleA) as! ModuleAViewController
        moduleAVC.tabBarItem.image = UIImage(named: "first")
        moduleAVC.tabBarItem.title = "ModuleAViewController"
        
        let moduleBVC = RouterService.viewControllerWithClassName("ModuleBViewController", storyboard: "ModuleB", bundle: Bundle.moduleB) as! ModuleBViewController
        moduleBVC.tabBarItem.image = UIImage(named: "second")
        moduleBVC.tabBarItem.title = "ModuleBViewController"
        
        tabBarController.viewControllers = [UINavigationController(rootViewController: moduleAVC), UINavigationController(rootViewController: moduleBVC)] as [UIViewController]
        
        return tabBarController
    }()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        configModuleBundle()
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = .white
        self.window?.rootViewController = tabBarController
        self.window?.makeKeyAndVisible()
        
        return true
    }
}

extension AppDelegate {
    func configModuleBundle() {
        if let path = Bundle(for: ModuleAViewController.self).path(forResource: "ModuleA", ofType: "bundle") {
            Bundle.moduleA = Bundle(path: path)!
        }
        
        if let path = Bundle(for: ModuleBViewController.self).path(forResource: "ModuleB", ofType: "bundle") {
            Bundle.moduleB = Bundle(path: path)!
        }
    }
}
