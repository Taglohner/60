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
    var timer: Timer { get set }
    var seconds: Double { get }
    var minutes: Double { get set }
    var currentAngle: Double { get set }
}

extension Stopwatch {
    var seconds: Double {
        return Double((currentAngle / 600) * 100).truncatingRemainder(dividingBy: 60)
    }
}
