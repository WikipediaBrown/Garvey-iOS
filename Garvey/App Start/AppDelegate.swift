//
//  AppDelegate.swift
//  Garvey
//
//  Created by Wikipedia Brown on 6/11/19.
//  Copyright © 2019 IamGoodBad. All rights reserved.
//

import UIKit
import RIBs
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    private var launchRouter: LaunchRouting?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Setup Firebase
        FirebaseApp.configure()
        
        launchRouter = RootBuilder(dependency: AppComponent()).build(withListener: <#RootListener#>)
        
        if let window = window {
            launchRouter?.launchFromWindow(window)
        }
        return true
    }
    
}

