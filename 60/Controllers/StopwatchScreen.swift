//
//  StopwatchViewController.swift
//  60
//
//  Created by Steven Taglohner on 05/06/2018.
//  Copyright © 2018 Steven Taglohner. All rights reserved.
//

import UIKit

class StopwatchScreen: UIViewController {
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        circularProgressView.angle = 0
        setupViews()
        setupNavigationBar()
    }
    
    // MARK: Properties
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    var timer = Timer()
    var interval = 0
    
    var milliseconds: Int {
        return interval * 1000
    }
    
    var seconds: Int {
        return interval % 60
    }
    
    var minutes: Int {
        return (interval / 60) % 60
    }
    
    var hours: Int {
        return interval / 3600
    }
    
    var angle: Double = 360
    
    let circularProgressView: KDCircularProgress = {
        let progressView = KDCircularProgress()
        progressView.backgroundColor = UIColor(white: 0, alpha: 0)
        progressView.startAngle = 0
        progressView.progressThickness = 0.4
        progressView.trackThickness = 0.5
        progressView.glowAmount = 1
        progressView.roundedCorners = false
        progressView.clockwise = true
        progressView.progressInsideFillColor = UIColor(white: 0, alpha: 0)
        progressView.trackColor = .gray
        progressView.set(colors: .green)
        return progressView
    }()
    
    let startPauseButton = StartResumeButton()
    
    let secondsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.text = "0"
        label.font = .boldSystemFont(ofSize: 84)
        label.textAlignment = .center
//        label.backgroundColor = .blue
        return label
    }()
    
    let minutesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
//        label.backgroundColor = .red
        label.font = .boldSystemFont(ofSize: 60)
        label.text = "0"
        label.textAlignment = .center
        return label
    }()
    
    fileprivate func setupViews() {
        
        view.backgroundColor = .black
        [secondsLabel].forEach({ circularProgressView.addSubview($0) })
        [minutesLabel].forEach({ secondsLabel.addSubview($0) })
        [circularProgressView, startPauseButton].forEach({ view.addSubview($0) })
        
        circularProgressView.anchor(top: nil, leading: nil, bottom: nil, trailing: nil, size: .init(width: 320, height: 320))
        circularProgressView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        circularProgressView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        secondsLabel.anchor(top: circularProgressView.topAnchor, leading: circularProgressView.leadingAnchor, bottom: circularProgressView.bottomAnchor, trailing: circularProgressView.trailingAnchor)
        
        minutesLabel.anchor(top: secondsLabel.topAnchor, leading: nil, bottom: nil, trailing: secondsLabel.trailingAnchor, size: .init(width: 80, height: 80
))

        startPauseButton.anchor(top: circularProgressView.bottomAnchor, leading: nil, bottom: nil, trailing: circularProgressView.trailingAnchor, padding: .init(top: 40, left: 0, bottom: 0, right: 0), size: .init(width: 80, height: 80))
        startPauseButton.addTarget(self, action: .startTimer, for: .touchUpInside)
    }
    
    
    func setupNavigationBar() {
        if let navigationBar = navigationController?.navigationBar {
            navigationBar.barStyle = .default
            navigationBar.isTranslucent = true
            navigationBar.tintColor = .lightText
            navigationBar.setBackgroundImage(UIImage(), for: .default)
        }
        
        let settingsButton = UIBarButtonItem(image: UIImage(named: "settings_icon"), style: .plain, target: self, action: .navigateToSettings)
        self.navigationItem.rightBarButtonItem = settingsButton
    }
    
    @ objc func navigateToSettings() {
        let settingScreen = SettingsScreen()
        self.navigationController?.pushViewController(settingScreen, animated: true)
        
    }

    // MARK: Methods
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: .updateTimer, userInfo: nil, repeats: true)
    }
    
    @objc func startTimer() {
        if startPauseButton.isActive {
            runTimer()

            startSecondsCircularProgressView()
        } else {
            pauseTimer()
        }
    }
    
    func pauseTimer() {
        timer.invalidate()
        circularProgressView.pauseAnimation()
    }
    
    func resumeTimer() {
        runTimer()
        startSecondsCircularProgressView()
    }
    
    func restartTimer() {
        timer.invalidate()
        interval = 0
        circularProgressView.stopAnimation()
    }


    func startSecondsCircularProgressView() {
        
        circularProgressView.animate(toAngle: angle, duration: Double(60 - seconds), completion: { (true) in
            if self.timer.isValid {
                self.circularProgressView.stopAnimation()
                self.startSecondsCircularProgressView()
            }
        })
    }

}

@objc extension StopwatchScreen {
    func updateTimer() {
        interval += 1
        secondsLabel.text = "\(seconds)"
        minutesLabel.text = "\(minutes)"
    }
}

fileprivate extension Selector {
    static let updateTimer = #selector(StopwatchScreen.updateTimer)
    static let startTimer = #selector(StopwatchScreen.startTimer)
    static let navigateToSettings = #selector(StopwatchScreen.navigateToSettings)
}
