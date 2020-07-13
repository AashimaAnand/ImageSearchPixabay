//
//  AppImages.swift
//  WynkImageSearch
//
//  Created by Aashima Anand on 11/07/20.
//  Copyright © 2020 personal. All rights reserved.
//

import UIKit

enum AppImages: String {
    case landingBg = "LandingBg"
    case imgPlaceholder = "ImagePlaceholder"
    case forwardArrow = "ForwardArrow"
    case backwardArrow = "BackwardArrow"
    var image: UIImage {
        return UIImage(named: self.rawValue) ?? UIImage()
    }
}

