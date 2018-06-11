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
        label.font = .boldSystemFont(ofSize: 84)
        label.textAlignment = .center
        return label
    }()
    
    let minutesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 60)
        label.text = "0"
        label.textAlignment = .center
        return label
    }()
    
    let progressView = KDCircularProgress()
    let startPauseButton = StartResumeButton()
    
    fileprivate func setupViews() {
        
        
        progressView.startAngle = 0
        progressView.progressThickness = 0.2
        progressView.trackThickness = 0.6
        progressView.clockwise = true
        progressView.gradientRotateSpeed = 2
        progressView.roundedCorners = false
        progressView.glowMode = .forward
        progressView.glowAmount = 0.9
        progressView.set(colors: .green)
        progressView.backgroundColor = .gray
        
        let stackView = UIStackView(arrangedSubviews: [secondsLabel, minutesLabel])
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        
        [progressView, stackView, startPauseButton].forEach {addSubview($0)}
        
        progressView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        progressView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        progressView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 20, bottom: 0, right: 20), size: .init(width: 0, height: progressView.frame.width))

        stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        startPauseButton.anchor(top: stackView.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 40, left: 0, bottom: 0, right: 0), size: .init(width: 80, height: 80))
        startPauseButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
}
