//
//  Stylesheet.swift
//  60
//
//  Created by Steven Taglohner on 13/06/2018.
//  Copyright © 2018 Steven Taglohner. All rights reserved.
//

import UIKit

enum Stylesheet {
    
    enum StopwatchView {
        static let secondsLabel = Style<UILabel> {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.textColor = .white
            $0.text = "0"
            $0.font = .boldSystemFont(ofSize: 120)
            $0.textAlignment = .center
        }
        
        static let minutesLabel = Style<UILabel> {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.textColor = .white
            $0.text = "0"
            $0.font = .boldSystemFont(ofSize: 60)
            $0.textAlignment = .center
        }
        
        static let progressView = Style<KDCircularProgress> {
            $0.startAngle = 0
            $0.progressThickness = 0.4
            $0.trackThickness = 0.5
            $0.clockwise = true
            $0.gradientRotateSpeed = 4
            $0.roundedCorners = false
            $0.glowMode = .forward
            $0.glowAmount = 0.9
            $0.set(colors: .green)
            $0.trackColor = .darkGray
        }
        
        static let buttonsStackView = Style<UIStackView> {
            $0.distribution = .equalSpacing
            $0.axis = .horizontal
            $0.alignment = .fill
        }
    }
    
    enum SettingsView {

    }
}
