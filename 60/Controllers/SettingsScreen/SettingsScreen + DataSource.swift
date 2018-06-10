//
//  SettingsScreen + DataSource.swift
//  60
//
//  Created by Steven Taglohner on 09/06/2018.
//  Copyright © 2018 Steven Taglohner. All rights reserved.
//

import UIKit

extension SettingsScreen: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: settingsCell) as! SettingsCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    
}
