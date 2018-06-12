//
//  AppDelegate.swift
//  60
//
//  Created by Steven Taglohner on 05/06/2018.
//  Copyright © 2018 Steven Taglohner. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController(rootViewController: StopwatchViewController())
        setupNavigationBar(navigationController.navigationBar)
        if let window = window {
            window.rootViewController = navigationController
            window.makeKeyAndVisible()
        }
        return true
    }

    func setupNavigationBar(_ navigationBar: UINavigationBar) {
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.isTranslucent = true
        navigationBar.tintColor = .white
        navigationBar.shadowImage = UIImage()
        navigationBar.barStyle = .blackTranslucent
    }
}

