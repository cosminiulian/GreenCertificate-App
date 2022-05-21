//
//  AppDelegate.swift
//  GreenCertificate-Simulator
//
//  Created by Cosmin Iulian on 31.12.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let navigationController = UINavigationController()
        
        if UserDefaults.standard.bool(forKey: UserDefaultsKeys.isLoggedIn) {
            if UserDefaults.standard.bool(forKey: UserDefaultsKeys.isDoctor) {
                navigationController.pushViewController(CreateCertificateViewController(), animated: false)
            } else {
                navigationController.pushViewController(ScanViewController(), animated: false)
            }
        } else {
            navigationController.pushViewController(LoginViewController(), animated: false)
        }
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }
    
}
