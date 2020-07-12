//
//  RecentSearches.swift
//  WynkImageSearch
//
//  Created by Aashima Anand on 12/07/20.
//  Copyright © 2020 personal. All rights reserved.
//

import Foundation

/// Reverse Queue
final class RecentSearches {
    static let shared: RecentSearches = RecentSearches()
    private var elements: [String] = []
    
    private init() {
        if let value = AppUserDefaults.value(forKey: .recentSearches) as? [String] {
            elements = value
        }
    }
    
    /// adds element to queue
    func enqueue(_ value: String) {
        if let index = elements.firstIndex(where: { $0 == value }) {
            bringToFirst(value, currentIndex: index)
        } else {
            if elements.count == 10 {
               let _ = dequeue()
            }
            elements.insert(value, at: 0)
        }
    }
    
    /// removes last element fron queue if overload limit has reached
    private func dequeue() -> String? {
        guard !elements.isEmpty else {
            return nil
        }
        return elements.removeLast()
    }
    
    /// points to the MRU element in the queue
    private var head: String? {
        return elements.first
    }
    
    /// points to the LRU element in the queue
    private var tail: String? {
        return elements.last
    }
    
    /// brings the recently used element on the top
    private func bringToFirst(_ value: String, currentIndex: Int) {
        elements.remove(at: currentIndex)
        elements.insert(value, at: 0)
    }
    
    /// return all the elements
    func searches() -> [String] {
        return elements
    }
}
