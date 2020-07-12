//
//  AppUserDefaults.swift
//  WynkImageSearch
//
//  Created by Aashima Anand on 13/07/20.
//  Copyright © 2020 personal. All rights reserved.
//

import Foundation

enum AppUserDefaults {
    
    enum Key : String {
 
        case recentSearches
    }
}

extension AppUserDefaults {
    
    static func value(forKey key: Key, file : String = #file, line : Int = #line, function : String = #function) -> Any? {
        
        guard let value = UserDefaults.standard.object(forKey: key.rawValue) else {
            
            return nil
        }
        
        return value
    }
    
    static func value<T>(forKey key: Key, fallBackValue : T, file : String = #file, line : Int = #line, function : String = #function) -> Any {
        
        guard let value = UserDefaults.standard.object(forKey: key.rawValue) else {
            
            return fallBackValue
        }
        
        return value
    }
    
    static func save(value : Any, forKey key : Key) {
        
        UserDefaults.standard.set(value, forKey: key.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    static func removeValue(forKey key : Key) {
        
        UserDefaults.standard.removeObject(forKey: key.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    static func removeAllValues() {
        
        let appDomain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: appDomain)
        UserDefaults.standard.synchronize()
        
    }
    
}




