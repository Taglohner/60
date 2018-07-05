//
//  ResetButton.swift
//  60
//
//  Created by Steven Taglohner on 13/06/2018.
//  Copyright © 2018 Steven Taglohner. All rights reserved.
//

import UIKit

class ResetButton: UIButton {

    var isActive = false
    var titleInitial = "Start"
    var titleActive = "Pause"
    var titleInactive = "Resume"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupButton() {
        layer.borderWidth = 2.0
        layer.borderColor = UIColor.white.cgColor
        layer.cornerRadius = 40
        layer.masksToBounds = false
        backgroundColor = .white
        setTitle(titleInitial, for: UIControl.State.normal)
        setTitleColor(.black, for: UIControl.State.normal)
        addTarget(self, action: #selector(buttonPressed), for: UIControl.Event.touchUpInside)
    }
    
    @objc func buttonPressed() {
        activateButton(bool: !isActive)
    }
    
    func activateButton(bool: Bool) {
        isActive = bool
        
        let color = bool ? .clear : UIColor.white
        let title = bool ? titleActive : titleInactive
        let titleColor = bool ? .white : UIColor.black
        backgroundColor = color
        setTitleColor(titleColor, for: UIControl.State.normal)
        setTitle(title, for: UIControl.State.normal)
    }
}

fileprivate extension Selector {
    static let buttonPressed = #selector(StartResumeButton.buttonPressed)
}
