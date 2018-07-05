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
    
    let secondsLabel = UILabel(style: Stylesheet.StopwatchView.secondsLabel)
    let minutesLabel = UILabel(style: Stylesheet.StopwatchView.minutesLabel)
    let progressView = KDCircularProgress(style: Stylesheet.StopwatchView.progressView)
    let startPauseButton = StartResumeButton()
    let resetButton = StartResumeButton()
    
    fileprivate func setupViews() {
        let buttonsStackView = UIStackView(style: Stylesheet.StopwatchView.buttonsStackView)
        [resetButton, startPauseButton].forEach { buttonsStackView.addArrangedSubview($0) }
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
