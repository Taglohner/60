//
//  StopwatchViewController.swift
//  60
//
//  Created by Steven Taglohner on 05/06/2018.
//  Copyright © 2018 Steven Taglohner. All rights reserved.
//

import UIKit

protocol Stopwatch {
    var interval: Int { get set }
    var milliseconds: Int { get }
    var seconds: Int { get }
    var minutes: Int { get }
    var hours: Int { get }
}

extension Stopwatch {
    var milliseconds: Int {
        return interval % 100
    }
    
    var seconds: Int {
        return (interval / 10) % 60
    }
    
    var minutes: Int {
        return (interval / 6000) % 60
    }
    
    var hours: Int {
        return interval / 3600000
    }
}

class StopwatchViewController: UIViewController, Stopwatch {
    
    // MARK: Properties
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    var stopWatchView = StopwatchView()
    var timer: Timer = Timer()
    var interval = 0
    var timeAngle: Double {
        return 360
    }
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        
    }
    
    func setupView() {
        stopWatchView = StopwatchView(frame: UIScreen.main.bounds)
        view.addSubview(stopWatchView)
        
        stopWatchView.startPauseButton.addTarget(self, action: .startStopButtonPressed, for: .touchUpInside)
    }
    
    @objc func startStopButtonPressed() {
        if stopWatchView.startPauseButton.isActive {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: .updateView, userInfo: nil, repeats: true)
            startCircleProgressViewAnimation()
        } else {
            timer.invalidate()
            stopWatchView.circularProgressView.pauseAnimation()
        }
    }
    
    func startCircleProgressViewAnimation() {
        stopWatchView.circularProgressView.animate(toAngle: 360, duration: Double(60 - seconds), completion: { (true) in
            if self.timer.isValid {
                self.stopWatchView.circularProgressView.stopAnimation()
                self.startCircleProgressViewAnimation()
            }
        })
    }
    
    @objc func updateView() {
        interval += 1
        stopWatchView.secondsLabel.text = "\(seconds)"
        stopWatchView.minutesLabel.text = "\(minutes)"
        
    }
    
    
}

fileprivate extension Selector {
    static let updateView = #selector(StopwatchViewController.updateView)
    static let startStopButtonPressed = #selector(StopwatchViewController.startStopButtonPressed)
}



//    func setupNavigationBar() {
//        if let navigationBar = navigationController?.navigationBar {
//            navigationBar.barStyle = .default
//            navigationBar.isTranslucent = true
//            navigationBar.tintColor = .lightText
//            navigationBar.setBackgroundImage(UIImage(), for: .default)
//        }
//
//        let settingsButton = UIBarButtonItem(image: UIImage(named: "settings_icon"), style: .plain, target: self, action: .navigateToSettings)
//        self.navigationItem.rightBarButtonItem = settingsButton
//    }
//
//    @objc func navigateToSettings() {
//        let settingScreen = SettingsScreen()
//        self.navigationController?.pushViewController(settingScreen, animated: true)
//    }
//
//    // MARK: Methods
//
//    func runTimer() {
//        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: .updateTimer, userInfo: nil, repeats: true)
//    }


//
//    @objc func startTimer() {
//        if startPauseButton.isActive {
//            runTimer()
//
//            startSecondsCircularProgressView()
//        } else {
//            pauseTimer()
//        }
//    }
//
//    func pauseTimer() {
//        timer.invalidate()
//        circularProgressView.pauseAnimation()
//    }
//
//    func resumeTimer() {
//        runTimer()
//        startSecondsCircularProgressView()
//    }
//
//    func restartTimer() {
//        timer.invalidate()
//        interval = 0
//        circularProgressView.stopAnimation()
//    }
//
//
//    func startSecondsCircularProgressView() {
//
//        circularProgressView.animate(toAngle: 360, duration: Double(60 - seconds), completion: { (true) in
//            if self.timer.isValid {
//                self.circularProgressView.stopAnimation()
//                self.startSecondsCircularProgressView()
//            }
//        })
//    }
//
//}
//
//@objc extension StopwatchViewController {
//    func updateTimer() {
//        interval += 1
//        secondsLabel.text = "\(seconds)"
//        minutesLabel.text = "\(minutes)"
//        currentAngle = circularProgressView.angle
//    }
//}
//
//fileprivate extension Selector {
//    static let updateTimer = #selector(StopwatchViewController.updateTimer)
//    static let startTimer = #selector(StopwatchViewController.startTimer)
//    static let navigateToSettings = #selector(StopwatchViewController.navigateToSettings)
//}
