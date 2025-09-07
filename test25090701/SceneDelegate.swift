//
//  SceneDelegate.swift
//  test25090701
//
//  Created by 黃庭璋 on 2025/9/7.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // 記錄場景連接事件
        LifecycleLogger.shared.logEvent(
            source: "SceneDelegate",
            event: "willConnectTo",
            description: LifecycleDescription.sceneDelegateEvents["willConnectTo"] ?? "場景即將連接"
        )
        
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // 記錄場景斷開連接事件
        LifecycleLogger.shared.logEvent(
            source: "SceneDelegate",
            event: "sceneDidDisconnect",
            description: LifecycleDescription.sceneDelegateEvents["sceneDidDisconnect"] ?? "場景已斷開連接"
        )
        
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // 記錄場景變活躍事件
        LifecycleLogger.shared.logEvent(
            source: "SceneDelegate",
            event: "sceneDidBecomeActive",
            description: LifecycleDescription.sceneDelegateEvents["sceneDidBecomeActive"] ?? "場景變成活躍狀態"
        )
        
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // 記錄場景即將失去活躍狀態事件
        LifecycleLogger.shared.logEvent(
            source: "SceneDelegate",
            event: "sceneWillResignActive",
            description: LifecycleDescription.sceneDelegateEvents["sceneWillResignActive"] ?? "場景即將失去活躍狀態"
        )
        
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // 記錄場景即將進入前景事件
        LifecycleLogger.shared.logEvent(
            source: "SceneDelegate",
            event: "sceneWillEnterForeground",
            description: LifecycleDescription.sceneDelegateEvents["sceneWillEnterForeground"] ?? "場景即將進入前景"
        )
        
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // 記錄場景進入背景事件
        LifecycleLogger.shared.logEvent(
            source: "SceneDelegate",
            event: "sceneDidEnterBackground",
            description: LifecycleDescription.sceneDelegateEvents["sceneDidEnterBackground"] ?? "場景已進入背景"
        )
        
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

