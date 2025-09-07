//
//  LifecycleLogger.swift
//  test25090701
//
//  iOS App 生命週期事件記錄器
//  用於統一管理和顯示所有生命週期事件
//

import UIKit

/// 生命週期事件資料模型
struct LifecycleEvent {
    let timestamp: Date
    let source: String       // AppDelegate, SceneDelegate, ViewController
    let event: String        // 事件名稱
    let description: String  // 詳細說明
    
    var formattedTime: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss.SSS"
        return formatter.string(from: timestamp)
    }
    
    var displayText: String {
        return "[\(formattedTime)] \(source) - \(event)\n說明: \(description)\n"
    }
}

/// 生命週期事件記錄器（單例模式）
class LifecycleLogger {
    static let shared = LifecycleLogger()
    
    private init() {}
    
    /// 儲存所有事件的陣列
    private(set) var events: [LifecycleEvent] = []
    
    /// 更新UI的回調函式（Closure）
    var onEventAdded: ((LifecycleEvent) -> Void)?
    
    /// 記錄新的生命週期事件
    /// - Parameters:
    ///   - source: 事件來源 (AppDelegate, SceneDelegate, ViewController)
    ///   - event: 事件名稱
    ///   - description: 事件詳細說明
    func logEvent(source: String, event: String, description: String) {
        let lifecycleEvent = LifecycleEvent(
            timestamp: Date(),
            source: source,
            event: event,
            description: description
        )
        
        events.append(lifecycleEvent)
        
        // 同時在控制台輸出
        print("🔄 [\(lifecycleEvent.formattedTime)] \(source) - \(event)")
        print("   📝 \(description)")
        
        // 通知UI更新
        DispatchQueue.main.async {
            self.onEventAdded?(lifecycleEvent)
        }
    }
    
    /// 清除所有事件記錄
    func clearEvents() {
        events.removeAll()
        print("🗑️ 已清除所有生命週期事件記錄")
    }
    
    /// 取得所有事件的格式化文字
    var allEventsText: String {
        return events.map { $0.displayText }.joined(separator: "\n")
    }
}

/// 生命週期事件的詳細說明
struct LifecycleDescription {
    static let appDelegateEvents = [
        "didFinishLaunchingWithOptions": "App 啟動完成，是設置全域配置的最佳時機",
        "applicationDidBecomeActive": "App 變成活躍狀態，可以接收使用者互動",
        "applicationWillResignActive": "App 即將失去活躍狀態（如來電、通知等中斷）",
        "applicationDidEnterBackground": "App 進入背景，應儲存重要資料",
        "applicationWillEnterForeground": "App 即將回到前景，可以更新UI",
        "applicationWillTerminate": "App 即將被終止，最後的清理機會",
        "configurationForConnecting": "建立（建立）新的場景配置（支援多視窗）",
        "didDiscardSceneSessions": "場景會話被丟棄，釋放相關資源"
    ]
    
    static let sceneDelegateEvents = [
        "willConnectTo": "場景即將連接，設置視窗和根視圖控制器",
        "sceneDidDisconnect": "場景已斷開連接，釋放場景相關資源",
        "sceneDidBecomeActive": "場景變成活躍狀態，恢復暫停的任務",
        "sceneWillResignActive": "場景即將失去活躍狀態，暫停正在執行的任務",
        "sceneWillEnterForeground": "場景即將進入前景，準備顯示給使用者",
        "sceneDidEnterBackground": "場景已進入背景，儲存場景狀態"
    ]
    
    static let viewControllerEvents = [
        "loadView": "載入視圖（僅在程式化建立（建立）視圖時呼叫）",
        "viewDidLoad": "視圖載入完成，進行一次性設置",
        "viewWillAppear": "視圖即將顯示，每次顯示前都會呼叫",
        "viewDidAppear": "視圖已經顯示，開始動畫或計時器",
        "viewWillDisappear": "視圖即將消失，暫停動畫或計時器",
        "viewDidDisappear": "視圖已經消失，清理資源",
        "viewWillUnload": "視圖即將卸載（iOS 6.0 後已棄用）",
        "dealloc/deinit": "物件（object）即將被釋放，最終清理"
    ]
}
