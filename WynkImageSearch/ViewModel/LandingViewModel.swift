//
//  LandingViewModel.swift
//  WynkImageSearch
//
//  Created by Aashima Anand on 12/07/20.
//  Copyright © 2020 personal. All rights reserved.
//

import Foundation

final class LandingViewModel {
    
    var buttonFont: AppFonts {
        return AppFonts.TimesNewRomansRegular
    }
    var buttonFontSize: FontSize {
        return FontSize.large
    }
    var buttonTextColor: AppColors {
        return AppColors.black
    }
    var bgImg: AppImages {
        return AppImages.landingBg
    }
    init() {  }
}
