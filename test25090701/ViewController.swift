//
//  ViewController.swift
//  test25090701
//
//  Created by 黃庭璋 on 2025/9/7.
//

import UIKit
        
class ViewController: UIViewController {
    
    // MARK: - UI Components
    
    private var titleLabel: UILabel!
    private var scrollView: UIScrollView!
    private var logTextView: UITextView!
    private var clearButton: UIButton!
    private var testButton: UIButton!
    
    // MARK: - Lifecycle Methods
    
    override func loadView() {
        super.loadView()
        LifecycleLogger.shared.logEvent(
            source: "ViewController",
            event: "loadView",
            description: LifecycleDescription.viewControllerEvents["loadView"] ?? "載入視圖"
        )
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 記錄視圖載入事件
        LifecycleLogger.shared.logEvent(
            source: "ViewController",
            event: "viewDidLoad",
            description: LifecycleDescription.viewControllerEvents["viewDidLoad"] ?? "視圖載入完成"
        )
        
        setupUI()
        setupLifecycleLogger()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        LifecycleLogger.shared.logEvent(
            source: "ViewController",
            event: "viewWillAppear",
            description: LifecycleDescription.viewControllerEvents["viewWillAppear"] ?? "視圖即將顯示"
        )
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        LifecycleLogger.shared.logEvent(
            source: "ViewController",
            event: "viewDidAppear",
            description: LifecycleDescription.viewControllerEvents["viewDidAppear"] ?? "視圖已經顯示"
        )
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        LifecycleLogger.shared.logEvent(
            source: "ViewController",
            event: "viewWillDisappear",
            description: LifecycleDescription.viewControllerEvents["viewWillDisappear"] ?? "視圖即將消失"
        )
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        LifecycleLogger.shared.logEvent(
            source: "ViewController",
            event: "viewDidDisappear",
            description: LifecycleDescription.viewControllerEvents["viewDidDisappear"] ?? "視圖已經消失"
        )
    }
    
    deinit {
        LifecycleLogger.shared.logEvent(
            source: "ViewController",
            event: "deinit",
            description: LifecycleDescription.viewControllerEvents["dealloc/deinit"] ?? "視圖控制器即將被釋放"
        )
    }
    
    // MARK: - Setup Methods
    
    private func setupUI() {
        // 如果沒有 Storyboard UI 元件，程式化建立（建立）
        if titleLabel == nil {
            createUIElements()
        }
        
        // 設置標題
        titleLabel.text = "🔄 iOS App 生命週期學習"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .systemBlue
        
        // 設置日誌文字視圖
        logTextView.font = UIFont.monospacedSystemFont(ofSize: 12, weight: .regular)
        logTextView.backgroundColor = UIColor.systemGray6
        logTextView.layer.cornerRadius = 8
        logTextView.isEditable = false
        logTextView.text = "📱 iOS App 生命週期事件記錄器\n準備接收事件...\n\n"
        
        // 設置按鈕
        clearButton.setTitle("🗑️ 清除記錄", for: .normal)
        clearButton.backgroundColor = .systemRed
        clearButton.setTitleColor(.white, for: .normal)
        clearButton.layer.cornerRadius = 8
        
        testButton.setTitle("🧪 測試新視圖", for: .normal)
        testButton.backgroundColor = .systemGreen
        testButton.setTitleColor(.white, for: .normal)
        testButton.layer.cornerRadius = 8
    }
    
    private func createUIElements() {
        // 程式化建立（建立）UI 元件
        view.backgroundColor = .systemBackground
        
        // 標題標籤
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        // 滾動視圖
        scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        // 日誌文字視圖
        logTextView = UITextView()
        logTextView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(logTextView)
        
        // 清除按鈕
        clearButton = UIButton(type: .system)
        clearButton.translatesAutoresizingMaskIntoConstraints = false
        clearButton.addTarget(self, action: #selector(clearButtonTapped), for: .touchUpInside)
        view.addSubview(clearButton)
        
        // 測試按鈕
        testButton = UIButton(type: .system)
        testButton.translatesAutoresizingMaskIntoConstraints = false
        testButton.addTarget(self, action: #selector(testButtonTapped), for: .touchUpInside)
        view.addSubview(testButton)
        
        // 設置約束
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // 標題標籤約束
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            titleLabel.heightAnchor.constraint(equalToConstant: 40),
            
            // 按鈕約束
            clearButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            clearButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            clearButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.45),
            clearButton.heightAnchor.constraint(equalToConstant: 44),
            
            testButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            testButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            testButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.45),
            testButton.heightAnchor.constraint(equalToConstant: 44),
            
            // 滾動視圖約束
            scrollView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            scrollView.bottomAnchor.constraint(equalTo: clearButton.topAnchor, constant: -16),
            
            // 日誌文字視圖約束
            logTextView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            logTextView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            logTextView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            logTextView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            logTextView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            logTextView.heightAnchor.constraint(greaterThanOrEqualTo: scrollView.heightAnchor)
        ])
    }
    
    private func setupLifecycleLogger() {
        // 設置事件回調，當有新事件時更新UI
        LifecycleLogger.shared.onEventAdded = { [weak self] event in
            DispatchQueue.main.async {
                self?.updateLogDisplay(with: event)
            }
        }
        
        // 顯示已有的事件
        updateFullLogDisplay()
    }
    
    // MARK: - UI Update Methods
    
    private func updateLogDisplay(with event: LifecycleEvent) {
        let newEventText = "\n" + event.displayText
        logTextView.text += newEventText
        
        // 自動滾動到底部
        let bottom = NSMakeRange(logTextView.text.count - 1, 1)
        logTextView.scrollRangeToVisible(bottom)
        
        // 添加視覺回饋
        UIView.animate(withDuration: 0.3) {
            self.logTextView.backgroundColor = UIColor.systemYellow.withAlphaComponent(0.3)
        } completion: { _ in
            UIView.animate(withDuration: 0.3) {
                self.logTextView.backgroundColor = UIColor.systemGray6
            }
        }
    }
    
    private func updateFullLogDisplay() {
        var displayText = "📱 iOS App 生命週期事件記錄器\n"
        displayText += "當前記錄了 \(LifecycleLogger.shared.events.count) 個事件\n"
        displayText += String(repeating: "=", count: 50) + "\n\n"
        
        if LifecycleLogger.shared.events.isEmpty {
            displayText += "尚無事件記錄，請嘗試：\n"
            displayText += "• 按 Home 鍵將 App 切到背景\n"
            displayText += "• 雙擊 Home 鍵或使用 App 切換器\n"
            displayText += "• 點擊「測試新視圖」按鈕\n"
            displayText += "• 接聽電話或收到通知\n\n"
        } else {
            displayText += LifecycleLogger.shared.allEventsText
        }
        
        logTextView.text = displayText
    }
    
    // MARK: - Button Actions
    
    @objc private func clearButtonTapped() {
        LifecycleLogger.shared.logEvent(
            source: "ViewController",
            event: "clearButtonTapped",
            description: "使用者點擊清除按鈕，準備清除所有事件記錄"
        )
        
        // 清除記錄
        LifecycleLogger.shared.clearEvents()
        
        // 更新UI
        updateFullLogDisplay()
        
        // 顯示清除成功提示
        let alert = UIAlertController(title: "✅ 清除完成", message: "所有生命週期事件記錄已清除", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "確定", style: .default))
        present(alert, animated: true)
    }
    
    @objc private func testButtonTapped() {
        LifecycleLogger.shared.logEvent(
            source: "ViewController",
            event: "testButtonTapped",
            description: "使用者點擊測試按鈕，將推送一個新的視圖控制器"
        )
        
        // 建立（建立）測試視圖控制器
        let testVC = TestViewController()
        testVC.title = "測試視圖"
        
        // 推送新視圖
        navigationController?.pushViewController(testVC, animated: true)
    }
}

// MARK: - 測試視圖控制器
class TestViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LifecycleLogger.shared.logEvent(
            source: "TestViewController",
            event: "viewDidLoad",
            description: "測試視圖控制器載入完成"
        )
        
        setupTestUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        LifecycleLogger.shared.logEvent(
            source: "TestViewController",
            event: "viewWillAppear",
            description: "測試視圖即將顯示"
        )
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        LifecycleLogger.shared.logEvent(
            source: "TestViewController",
            event: "viewDidAppear",
            description: "測試視圖已經顯示"
        )
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        LifecycleLogger.shared.logEvent(
            source: "TestViewController",
            event: "viewWillDisappear",
            description: "測試視圖即將消失"
        )
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        LifecycleLogger.shared.logEvent(
            source: "TestViewController",
            event: "viewDidDisappear",
            description: "測試視圖已經消失"
        )
    }
    
    deinit {
        LifecycleLogger.shared.logEvent(
            source: "TestViewController",
            event: "deinit",
            description: "測試視圖控制器即將被釋放"
        )
    }
    
    private func setupTestUI() {
        view.backgroundColor = .systemBackground
        
        let label = UILabel()
        label.text = "🧪 這是測試視圖\n\n點擊返回按鈕可以觀察\nviewWillDisappear 和 viewDidDisappear 事件"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32)
        ])
    }
}

