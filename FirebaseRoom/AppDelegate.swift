//
//  AppDelegate.swift
//  FirebaseRoom
//
//  Created by Katy on 2017/10/29.
//  Copyright © 2017年 Katy. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, Launcher {

    var window: UIWindow?
    var mPresenter: AppPresenter?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        Database.database().isPersistenceEnabled = true
        mPresenter = AppPresenter(launcher: self, userName: UserDefaults.standard.string(forKey: "name") ?? "")
        
        window = UIWindow(frame: UIScreen.main.bounds)
        mPresenter!.open()
        return true
    }
    
    func goToInputNameView() {
        goTo(storyboardName: "Main", viewIdentifier: "InputNameView")
    }
    
    func goToChatView() {
        goTo(storyboardName: "Main", viewIdentifier: "ChatView")
    }

    private func goTo(storyboardName: String, viewIdentifier: String) {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        window?.rootViewController = storyboard.instantiateViewController(withIdentifier: viewIdentifier)
        window?.makeKeyAndVisible()
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

