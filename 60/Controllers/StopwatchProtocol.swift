//
//  StopwatchProtocol.swift
//  60
//
//  Created by Steven Taglohner on 11/06/2018.
//  Copyright © 2018 Steven Taglohner. All rights reserved.
//

import Foundation

import UIKit

protocol Stopwatch {
    var interval: Double { get set }
    var milliseconds: Double { get }
    var seconds: Double { get }
    var minutes: Double { get }
    var hours: Double { get }
    var currentAngle: Double { get }
    var animationDuration: Double { get }

}

extension Stopwatch {
    var milliseconds: Double {
        return interval.truncatingRemainder(dividingBy: 1000)
    }
    
    var seconds: Double {
        return (interval / 100).truncatingRemainder(dividingBy: 60)
    }
    
    var minutes: Double {
        return (interval / 6000).truncatingRemainder(dividingBy: 60)
    }
    
    var hours: Double {
        return interval / 3600000
    }
    
    var currentAngle: Double {
        return Double(360 * (interval / 6000)).truncatingRemainder(dividingBy: 360)
    }
    
    var animationDuration: Double {
        return 60 - Double(60 * (interval / 6000)).truncatingRemainder(dividingBy: 60)
    }
}
