//
//  StartResumeButton.swift
//  60
//
//  Created by Steven Taglohner on 08/06/2018.
//  Copyright © 2018 Steven Taglohner. All rights reserved.
//

import UIKit

class StartResumeButton: UIButton {
    
    var isActive = false
    
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
        setTitle("Start", for: .normal)
        setTitleColor(.black, for: .normal)
        addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    @objc func buttonPressed() {
        activateButton(bool: !isActive)
    }
    
    func activateButton(bool: Bool) {
        isActive = bool
        
        let color = bool ? .clear : UIColor.white
        let title = bool ? "Pause" : "Resume"
        let titleColor = bool ? .white : UIColor.black
        backgroundColor = color
        setTitleColor(titleColor, for: .normal)
        setTitle(title, for: .normal)
    }
}

fileprivate extension Selector {
    static let buttonPressed = #selector(StartResumeButton.buttonPressed)
}
