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
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
    
    let startPauseButton = StartResumeButton()
    
    fileprivate func setupViews() {
        backgroundColor = .black
        [secondsLabel].forEach({ circularProgressView.addSubview($0) })
        [minutesLabel].forEach({ secondsLabel.addSubview($0) })
        [circularProgressView, startPauseButton].forEach({ addSubview($0) })
        circularProgressView.anchor(top: nil, leading: nil, bottom: nil, trailing: nil, size: .init(width: 320, height: 320))
        circularProgressView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        circularProgressView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        secondsLabel.anchor(top: circularProgressView.topAnchor, leading: circularProgressView.leadingAnchor, bottom: circularProgressView.bottomAnchor, trailing: circularProgressView.trailingAnchor)
        minutesLabel.anchor(top: secondsLabel.topAnchor, leading: nil, bottom: nil, trailing: secondsLabel.trailingAnchor, size: .init(width: 80, height: 80))
        startPauseButton.anchor(top: circularProgressView.bottomAnchor, leading: nil, bottom: nil, trailing: circularProgressView.trailingAnchor, padding: .init(top: 40, left: 0, bottom: 0, right: 0), size: .init(width: 80, height: 80))
    }
}
