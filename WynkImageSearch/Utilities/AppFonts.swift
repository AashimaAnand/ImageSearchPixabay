//
//  AppFonts.swift
//  WynkImageSearch
//
//  Created by Aashima Anand on 12/07/20.
//  Copyright © 2020 personal. All rights reserved.
//

import Foundation
import UIKit


enum AppFonts : String {
    case TimesNewRomansRegular = "TimesNewRomanPSMT"
    case TimesNewRomansBold = "TimesNewRomanPS-BoldMT"
}

enum FontSize: CGFloat {
    case small = 18.0
    case medium = 24.0
    case large = 26.0
    
}

extension AppFonts {
 
    func withSize(_ fontSize: FontSize) -> UIFont {
        
        return UIFont(name: self.rawValue, size: fontSize.rawValue) ?? UIFont.systemFont(ofSize: fontSize.rawValue)
    }
    
    func withDefaultSize() -> UIFont {
        return UIFont(name: self.rawValue, size: FontSize.small.rawValue) ?? UIFont.systemFont(ofSize: FontSize.small.rawValue)
    }
    
   
}
