//
//  AppColors.swift
//  WynkImageSearch
//
//  Created by Aashima Anand on 12/07/20.
//  Copyright © 2020 personal. All rights reserved.
//

import UIKit

enum AppColors: String {
    case wynkTheme = "WynkTheme"
    case black = "BlackColor"
    
    var tint: UIColor {
        return UIColor(named: self.rawValue) ?? UIColor()
    }
}
