//
//  AppDelegate.swift
//  FakeUserApp
//
//  Created by Gedikoglu, Ali on 11.01.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        let viewController = AppDI.shared.fakeUserListDependencies()
        window?.rootViewController = UINavigationController(rootViewController: viewController)
        return true
    }
}

