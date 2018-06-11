//
//  StopwatchViewController.swift
//  60
//
//  Created by Steven Taglohner on 05/06/2018.
//  Copyright © 2018 Steven Taglohner. All rights reserved.
//

import UIKit

class StopwatchViewController: UIViewController, Stopwatch {

    // MARK: Properties
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    var stopWatchView = StopwatchView()
    var timer: Timer = Timer()
    var interval: Double = 0
    var progressViewCurrentAngle: Double = 0
    
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
    
    // Actions
    
    @objc func startStopButtonPressed() {
        if stopWatchView.startPauseButton.isActive {
            startStopwatch()
        } else {
            stopWatchView.progressView.pauseAnimation()
            pauseStopwatch()
        }
    }

    // Helper methods
    
    private func startTimer() {
        self.timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: .updateView, userInfo: nil, repeats: true)
    }
    
    private func startStopwatch() {
        startTimer()
        startProgressViewAnimation()
    }
    
    func pauseStopwatch() {
        self.timer.invalidate()
    }
    
    private func resetStopwatch() {
        timer.invalidate()
        interval = 0
    }
    
    func startProgressViewAnimation() {
        
        stopWatchView.progressView.animate(fromAngle: currentAngle, toAngle: 360, duration: animationDuration) { (true) in
            if self.timer.isValid {
                self.stopWatchView.progressView.stopAnimation()
                self.startProgressViewAnimation()
            }
        }
        
//        stopWatchView.progressView.animate(toAngle: 360, duration: animationDuration) { (true) in
//            if self.timer.isValid {
//                self.stopWatchView.progressView.stopAnimation()
//                self.startProgressViewAnimation()
//            }
//        }
    }
    
    func restoreApplicationState() {
        stopWatchView.progressView.animate(fromAngle: currentAngle, toAngle: 360, duration: animationDuration) { (true) in
            if self.timer.isValid {
                self.stopWatchView.progressView.stopAnimation()
                self.startProgressViewAnimation()
            }
        }
    }
    
    @objc func updateView() {
        interval += 1
        stopWatchView.secondsLabel.text = "\(Int(seconds))"
        stopWatchView.minutesLabel.text = "\(Int(minutes))"
    }
}

fileprivate extension Selector {
    static let updateView = #selector(StopwatchViewController.updateView)
    static let startStopButtonPressed = #selector(StopwatchViewController.startStopButtonPressed)
}
