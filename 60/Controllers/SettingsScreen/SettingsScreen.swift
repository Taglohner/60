//
//  SettingsScreen.swift
//  60
//
//  Created by Steven Taglohner on 09/06/2018.
//  Copyright © 2018 Steven Taglohner. All rights reserved.
//

import UIKit

class SettingsScreen: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: Properties
    var tableView = UITableView()
    var settingsCell = "settingsCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }

    
    func setupTableView() {
        tableView = UITableView(frame: UIScreen.main.bounds, style: UITableViewStyle.grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .black
        tableView.scrollIndicatorInsets = .zero
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.contentInsetAdjustmentBehavior = .automatic
        tableView.separatorStyle = .none
        tableView.bounces = false
        tableView.register(SettingsCell.self, forCellReuseIdentifier: settingsCell)
        [tableView].forEach { view.addSubview($0) }
    }
    
    
    
    
    
}
