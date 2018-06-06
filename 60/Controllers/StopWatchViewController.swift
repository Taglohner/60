//
//  ViewController.swift
//  60
//
//  Created by Steven Taglohner on 05/06/2018.
//  Copyright © 2018 Steven Taglohner. All rights reserved.
//

import UIKit

class StopWatchViewController: UIViewController {
    
    // MARK: Properties
    
    var timer = Timer()
    var interval = 0
    
    var milliseconds: Int {
        return interval % 100
    }
    
    var seconds: Int {
        return (interval / 100) % 60
    }
    
    var minutes: Int {
        return (interval / 60) % 60
    }
    
    var hours: Int {
        return (interval / 3600)
    }
    
    @IBOutlet weak var millisecondsLabel: UILabel!
    @IBOutlet weak var secondsLabel: UILabel!
    @IBOutlet weak var minutesLabel: UILabel!
    @IBOutlet weak var startStopButton: UIButton!
    @IBOutlet weak var restartButton: UIButton!
    
    fileprivate func customiseViewElements() {}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    // MARK: Methods
    
    fileprivate func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: .updateTimer, userInfo: nil, repeats: true)
    }
    
    fileprivate func startStopTimer() {
        runTimer()
    }
    
    fileprivate func restartTimer() {
        timer.invalidate()
        secondsLabel.text = "0"
    }

    
    // MARK: Actions
    
    @IBAction fileprivate func restartButtonPressed(_ sender: Any) {
        restartTimer()
    }
    
    @IBAction fileprivate func startStopButtonPressed(_ sender: Any) {
        startStopTimer()
    }
    
}

@objc extension StopWatchViewController {
    func updateTimer() {
        interval += 1
        secondsLabel.text = "\(seconds)"
        millisecondsLabel.text = "\(milliseconds)"
    }
}

fileprivate extension Selector {
    static let updateTimer = #selector(StopWatchViewController.updateTimer)
}

