//
//  CompanieModel.swift
//  SwedLon
//
//  Created by Uladzislau Daratsiuk on 11/04/2018.
//  Copyright © 2018 Uladzislau Daratsiuk. All rights reserved.
//

import Foundation
import UIKit

class Company {
    var name: String?
    var logoName: String?
    var link: String?
    
    init(name:String?, logoName: String?, link: String?) {
        self.name = name
        self.logoName = logoName
        self.link = link
    }
    
}
