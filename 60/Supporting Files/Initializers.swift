//
//  Initializers.swift
//  60
//
//  Created by Steven Taglohner on 13/06/2018.
//  Copyright © 2018 Steven Taglohner. All rights reserved.
//

import UIKit

public struct Style<View: UIView> {
    public let style: (View) -> Void
    public init(_ style: @escaping (View) -> Void) {
        self.style = style
    }
    public func apply(to view: View) {
        style(view)
    }
}
