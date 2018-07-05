//
//  SettingsScreen + TableViewCell.swift
//  60
//
//  Created by Steven Taglohner on 09/06/2018.
//  Copyright © 2018 Steven Taglohner. All rights reserved.
//

import UIKit

class SettingsCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.layer.backgroundColor = UIColor.clear.cgColor
        self.contentView.backgroundColor = UIColor.clear
        self.backgroundColor = .clear
        self.selectionStyle = .none
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
