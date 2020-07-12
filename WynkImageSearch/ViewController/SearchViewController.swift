//
//  SearchViewController.swift
//  WynkImageSearch
//
//  Created by Aashima Anand on 12/07/20.
//  Copyright © 2020 personal. All rights reserved.
//

import UIKit
// SearchViewController
class SearchViewController: BaseViewController {
    // MARK: - IBOUTLETS
    
    @IBOutlet weak var resultsTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    // MARK: - STORED PROPERTIES
    var viewModel: SearchViewModel!
    let spinner = UIActivityIndicatorView(style: .large)
    // MARK: - COMPUTED PROPERTIES
    // MARK: - INITIALIZER
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showNavBar()
    }
    // MARK: - FUNCTIONS
    private func setUpView() {
        self.title = viewModel.pageTitle
        searchBar.delegate = self
        searchBar.searchTextField.delegate = self
        resultsTableView.delegate = self
        resultsTableView.dataSource = self
        resultsTableView.registerCell(with: ImageTableViewCell.self)
        spinner.hidesWhenStopped = true
        resultsTableView.tableFooterView = spinner

    }
    // MARK: - IBACTIONS
}
// MARK: - EXTENSIONS
/// SearchViewController
extension SearchViewController: UISearchBarDelegate, UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text else { return true }
        let valid = viewModel.isSearchTextValid(searchText: text)
        valid.0 ? viewModel.searchFor(text: text) : showAlert(LocalizedString.oops.localized, valid.1)
        self.view.endEditing(true)
        return true
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty { viewModel.resetData() }
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        print(RecentSearches.shared.searches())
        return true
    }
}

/// SearchViewController
extension SearchViewController: SearchViewModelDelegate {
    func failure(error: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            if !error.isEmpty { self.showAlert(LocalizedString.oops.localized, error) }
            self.spinner.stopAnimating()
        }
    }
    
    func reloadData() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.resultsTableView.reloadData()
            self.spinner.stopAnimating()
        }
    }
}

