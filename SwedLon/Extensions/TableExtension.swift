//
//  TableExtension.swift
//  SwedLon
//
//  Created by Uladzislau Daratsiuk on 13/04/2018.
//  Copyright © 2018 Uladzislau Daratsiuk. All rights reserved.
//

import Foundation
import UIKit

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let title = menuTitles[indexPath.row]
        let cell = menuTable.dequeueReusableCell(withIdentifier: menuTableCellId, for: indexPath) as! MenuCell
        cell.backgroundColor = UIColor.white.withAlphaComponent(0)
        cell.titleName.text = title
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        menuTable.deselectRow(at: indexPath, animated: true)
    }
    
    
}
