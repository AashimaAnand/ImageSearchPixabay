//
//  SearchViewMode.swift
//  WynkImageSearch
//
//  Created by Aashima Anand on 12/07/20.
//  Copyright © 2020 personal. All rights reserved.
//

import Foundation

protocol SearchViewModelDelegate: class {
    func failure(error: String)
    func reloadData()
}
// SearchViewModel
final class SearchViewModel {
    // MARK: - STORED PROPERTIES
    private weak var delegate: SearchViewModelDelegate?
    private var maxSearchTextCharCount = 100
    private var networkManager: NetworkManager!
    private var page: Int = 1
    private var images: [Image] = []
    private var searchText: String = ""
    // MARK: - COMPUTED PROPERTIES
    var pageTitle: String {
        return LocalizedString.search.localized
    }
    // MARK: - INITIALIZER
    init(networkManager: NetworkManager,
         delegate: SearchViewModelDelegate) {
        self.networkManager = networkManager
        self.delegate = delegate
    }
    // MARK: - FUNCTIONS
    /// checks if the search text is valid and return an appropriate error message
    func isSearchTextValid(searchText: String) -> (Bool, String) {
        if searchText.isEmpty {
            return (false, LocalizedString.searchTextCannotBeEmpty.localized)
        } else if searchText.count > maxSearchTextCharCount {
            return (false, LocalizedString.greaterThan100.localized.replace(string: "max", withString: "\(maxSearchTextCharCount)"))
        }
        return (true, "")
    }
    func resetData() {
        images = []
        page = 1
        searchText = ""
        self.delegate?.reloadData()
    }
    /// call for data
    func searchFor(text: String) {
        searchText = text
        networkManager.getImages(page: page, searchText: text.replace(string: " ", withString: "+")) { [weak self] (images, error) in
            guard let self = self else { return }
            if let error = error {
                self.delegate?.failure(error: error == .pageOutOfIndex ? "" : error.rawValue)
                self.page = 0
                return
            }
            self.images += images
            self.page += 1
            RecentSearches.shared.enqueue(self.searchText)
            self.delegate?.reloadData()
        }
    }
    
    func shouldPaginate(row: Int) -> Bool{
        if row == images.count - 1 && page > 1{
            searchFor(text: searchText)
            return true
        } else { return false }
        
    }
    func allImages() -> [Image] {
        return images
    }
}

// MARK: EXTENSIONS
// MARK: TABLE AND HEADERS
extension SearchViewModel {
    func numberOfRows() -> Int {
        return images.count
    }
    
    func cellViewModelForIndexPath(_ indexPath: IndexPath) -> ImageTableViewCellViemModel {
        return ImageTableViewCellViemModel(image: images[indexPath.row]) 
    }

}
