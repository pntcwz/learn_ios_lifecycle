//
//  AppDelegate.swift
//  test25090701
//
//  Created by 黃庭璋 on 2025/9/7.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // 記錄 App 啟動事件
        LifecycleLogger.shared.logEvent(
            source: "AppDelegate",
            event: "didFinishLaunchingWithOptions",
            description: LifecycleDescription.appDelegateEvents["didFinishLaunchingWithOptions"] ?? "App 啟動完成"
        )
        
        // Override point for customization after application launch.
        return true
    }
    
    // MARK: - Application Lifecycle Events
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        LifecycleLogger.shared.logEvent(
            source: "AppDelegate",
            event: "applicationDidBecomeActive",
            description: LifecycleDescription.appDelegateEvents["applicationDidBecomeActive"] ?? "App 變成活躍狀態"
        )
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        LifecycleLogger.shared.logEvent(
            source: "AppDelegate",
            event: "applicationWillResignActive",
            description: LifecycleDescription.appDelegateEvents["applicationWillResignActive"] ?? "App 即將失去活躍狀態"
        )
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        LifecycleLogger.shared.logEvent(
            source: "AppDelegate",
            event: "applicationDidEnterBackground",
            description: LifecycleDescription.appDelegateEvents["applicationDidEnterBackground"] ?? "App 進入背景"
        )
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        LifecycleLogger.shared.logEvent(
            source: "AppDelegate",
            event: "applicationWillEnterForeground",
            description: LifecycleDescription.appDelegateEvents["applicationWillEnterForeground"] ?? "App 即將回到前景"
        )
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        LifecycleLogger.shared.logEvent(
            source: "AppDelegate",
            event: "applicationWillTerminate",
            description: LifecycleDescription.appDelegateEvents["applicationWillTerminate"] ?? "App 即將被終止"
        )
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // 記錄場景配置事件
        LifecycleLogger.shared.logEvent(
            source: "AppDelegate",
            event: "configurationForConnecting",
            description: LifecycleDescription.appDelegateEvents["configurationForConnecting"] ?? "建立（建立）新的場景配置"
        )
        
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // 記錄場景會話丟棄事件
        LifecycleLogger.shared.logEvent(
            source: "AppDelegate",
            event: "didDiscardSceneSessions",
            description: "\(LifecycleDescription.appDelegateEvents["didDiscardSceneSessions"] ?? "場景會話被丟棄") - 丟棄了 \(sceneSessions.count) 個場景"
        )
        
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

