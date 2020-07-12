//
//  LocalizedString.swift
//  WynkImageSearch
//
//  Created by Aashima Anand on 12/07/20.
//  Copyright © 2020 personal. All rights reserved.
//

import Foundation
enum LocalizedString : String {
    case continueText = "continue"
    case search = "search"
    case fullScreen = "fullScreen"
    case searchTextCannotBeEmpty = "searchTextCannotBeEmpty"
    case greaterThan100 = "greaterThan100"
    case oops = "oops"
    case ok = "ok"
    case couldNotFindAnything = "couldNotFindAnything"
    
}



extension LocalizedString {
    var localized : String {
        return self.rawValue.localized
    }
}
