//
//  AppDelegate.swift
//  Death Note
//
//  Created by Artem Serebriakov on 10.08.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let rootVC = ViewController()
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.navigationBar.tintColor = .white
        navVC.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
//        navVC.navigationBar.barTintColor = .white
        window?.rootViewController = navVC
        window?.makeKeyAndVisible()
        
        window?.overrideUserInterfaceStyle = .dark
        
        return true
    }


    
}

