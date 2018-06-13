//
//  StopwatchView.swift
//  60
//
//  Created by Steven Taglohner on 10/06/2018.
//  Copyright © 2018 Steven Taglohner. All rights reserved.
//

import UIKit

class StopwatchView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let secondsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.text = "0"
        label.font = .boldSystemFont(ofSize: 120)
        label.textAlignment = .center
        return label
    }()
    
    let minutesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 80)
        label.text = "0"
        label.textAlignment = .center
        return label
    }()
    
    let progressView = KDCircularProgress()
    let startPauseButton = StartResumeButton()
    let resetButton = StartResumeButton()
    
    fileprivate func setupViews() {
        progressView.startAngle = 0
        progressView.progressThickness = 0.4
        progressView.trackThickness = 0.5
        progressView.clockwise = true
        progressView.gradientRotateSpeed = 4
        progressView.roundedCorners = false
        progressView.glowMode = .forward
        progressView.glowAmount = 0.9
        progressView.set(colors: .green)
        progressView.trackColor = .darkGray
        
        let buttonsStackView = UIStackView(arrangedSubviews: [resetButton, startPauseButton])
        buttonsStackView.distribution = .equalSpacing
        buttonsStackView.axis = .horizontal
        buttonsStackView.alignment = .fill
        
        [progressView, buttonsStackView].forEach { addSubview($0) }
        [secondsLabel, minutesLabel].forEach { progressView.addSubview($0)}
      
        progressView.anchor(top: nil, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, size: .init(width: 0, height: screenWidht))
        progressView.center(to: self)
        
        secondsLabel.anchor(top: progressView.topAnchor, leading: progressView.leadingAnchor, bottom: progressView.bottomAnchor, trailing: progressView.trailingAnchor)
        minutesLabel.anchor(top: topAnchor, leading: nil, bottom: nil, trailing: trailingAnchor, padding: .init(top: 150, left: 0, bottom: 0, right: 0), size: .init(width: 100, height: 80))
        
        startPauseButton.size(.init(width: 80, height: 80))
        resetButton.size(.init(width: 80, height: 80))
        
        buttonsStackView.anchor(top: nil, leading: progressView.leadingAnchor, bottom: bottomAnchor, trailing: progressView.trailingAnchor, padding: .init(top: 0, left: 34, bottom: 34, right: 34))
    }
}
