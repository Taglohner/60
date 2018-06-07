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
    
    var timer = Timer()
    var interval = 0
    var isPaused = false
    
    var milliseconds: Int {
        return interval % 100
    }
    
    var seconds: Int {
        return (interval / 100) % 60
    }
    
    var minutes: Int {
        return (interval / 6000) % 60
    }
    
    var hours: Int {
        return (interval / 360000)
    }
    
    var angle: Double = 360
    
    
    @IBOutlet weak var secondsCircularProgressView: KDCircularProgress!
    @IBOutlet weak var millisecondsLabel: UILabel!
    @IBOutlet weak var secondsLabel: UILabel!
    @IBOutlet weak var minutesLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet weak var pauseResumeButton: UIButton!
    
    fileprivate func customiseViewElements() {}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        secondsCircularProgressView.angle = 0
    }
    
    // MARK: Methods
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: .updateTimer, userInfo: nil, repeats: true)
    }
    
    func startTimer() {
        runTimer()
        startSecondsCircularProgressView()
    }
    
    func pauseTimer() {
        isPaused = true
        pauseResumeButton.titleLabel?.text = "Pause"
        timer.invalidate()
        secondsCircularProgressView.pauseAnimation()
    }
    
    func resumeTimer() {
        pauseResumeButton.titleLabel?.text = "Resume"
        isPaused = false
        runTimer()
        startSecondsCircularProgressView()
    }
    
    func restartTimer() {
        timer.invalidate()
        interval = 0
        secondsLabel.text = "0"
        millisecondsLabel.text = "0"
        minutesLabel.text = "0"
        secondsCircularProgressView.stopAnimation()
    }
    

    func startSecondsCircularProgressView() {
        secondsCircularProgressView.animate(toAngle: angle, duration: 60, completion: { (true) in
            if self.timer.isValid {
                self.secondsCircularProgressView.stopAnimation()
                self.startSecondsCircularProgressView()
            }
        })
    }
    
    // MARK: Actions
    @IBAction func pauseResumeButtonPressed(_ sender: Any) {
        if isPaused {
            resumeTimer()
        } else {
            pauseTimer()
        }
    }
    
    @IBAction  func restartButtonPressed(_ sender: Any) {
        restartTimer()
    }
    
    @IBAction  func startButtonPressed(_ sender: Any) {
        startTimer()
    }
}

@objc extension StopwatchViewController {
    func updateTimer() {
        interval += 1
        secondsLabel.text = "\(seconds)"
        millisecondsLabel.text = "\(milliseconds)"
        minutesLabel.text = "\(minutes)"
    }
}

fileprivate extension Selector {
    static let updateTimer = #selector(StopwatchViewController.updateTimer)
}
