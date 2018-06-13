//
//  StopwatchViewController.swift
//  60
//
//  Created by Steven Taglohner on 05/06/2018.
//  Copyright © 2018 Steven Taglohner. All rights reserved.
//

import UIKit

class StopwatchViewController: UIViewController {
    
    // MARK: Properties
    
    var stopWatchView = StopwatchView()
    var timer: Timer = Timer()
    var currentAngle: Double = 0
    var minutes: Double = 0
    let notificationCenter = NotificationCenter.default
    var seconds: Double {
        return Double((currentAngle / 600) * 100).truncatingRemainder(dividingBy: 60)
    }
 
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // observe when the app goes to the background and pause it
        notificationCenter.addObserver(self, selector: .saveAppState, name: .willResignActive, object: nil)
        // prevend screen from locking while app is on the foreground
        UIApplication.shared.isIdleTimerDisabled = true
        setupViews()
        setupNavigationBar()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        saveAppState()
    }
    
    // View
    
    private func setupViews() {
        stopWatchView = StopwatchView(frame: view.frame)
        view.addSubview(stopWatchView)
        stopWatchView.startPauseButton.addTarget(self, action: .startStopButtonPressed, for: .touchUpInside)
    }
    
    func setupNavigationBar() {
        let settingsButton = UIBarButtonItem(image: UIImage(named: "settings_icon"), style: .plain, target: self, action: .pushSettingsViewController)
        self.navigationItem.rightBarButtonItem = settingsButton
    }
    
    // Actions
    
    @objc fileprivate func startStopButtonPressed() {
        if stopWatchView.startPauseButton.isActive {
            startStopwatch()
        } else {
            pauseStopwatch()
        }
    }
    
    @objc fileprivate func pushSettingsViewController() {
        let settingsViewController = SettingsViewController()
        navigationController?.pushViewController(settingsViewController, animated: true)
    }
    
    @objc fileprivate func saveAppState() {
        if stopWatchView.startPauseButton.isActive {
            stopWatchView.startPauseButton.sendActions(for: .touchUpInside)
        }
    }
    
    @objc fileprivate func updateView() {
        stopWatchView.secondsLabel.text = "\(Int(seconds))"
        stopWatchView.minutesLabel.text = "\(Int(minutes))"
        currentAngle = stopWatchView.progressView.getCurrentAngle()
    }
    
    // MARK: Helper methods
    
    // The timer update the view every second.
    private func startTimer() {
        self.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: .updateView, userInfo: nil, repeats: true)
    }
    
    private func startStopwatch() {
        startTimer()
        startProgressViewAnimation()
    }
    
    private func pauseStopwatch() {
        self.timer.invalidate()
        stopWatchView.progressView.pauseAnimation()
    }
    
    private func resetStopwatch() {
        timer.invalidate()
        stopWatchView.progressView.stopAnimation()
        stopWatchView.progressView.angle = 0
        minutes = 0
        currentAngle = 0
    }
    
    private func startProgressViewAnimation() {
        stopWatchView.progressView.animate(fromAngle: currentAngle, toAngle: 360, duration: (60 - seconds)) { (true) in
            if self.timer.isValid {
                self.currentAngle = 0
                self.minutes += 1
                self.stopWatchView.progressView.stopAnimation()
                self.startProgressViewAnimation()
            }
        }
    }
    
    // Remove observer when class instance is unmounted
    deinit {
        notificationCenter.removeObserver(self)
    }
}

fileprivate extension Selector {
    static let updateView = #selector(StopwatchViewController.updateView)
    static let startStopButtonPressed = #selector(StopwatchViewController.startStopButtonPressed)
    static let saveAppState = #selector(StopwatchViewController.saveAppState)
    static let pushSettingsViewController = #selector(StopwatchViewController.pushSettingsViewController)
}

fileprivate extension Notification.Name {
    static let willResignActive = Notification.Name.UIApplicationWillResignActive
}

/*
 
 stop status and set new status
 
 stopWatchView.progressView.stopAnimation()
 stopWatchView.progressView.angle = 10
 currentAngle = 10
 
 */
