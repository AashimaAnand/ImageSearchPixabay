//
//  SearchViewController+TableView.swift
//  WynkImageSearch
//
//  Created by Aashima Anand on 12/07/20.
//  Copyright © 2020 personal. All rights reserved.
//

import UIKit

extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let imageCell = tableView.dequeueCell(with: ImageTableViewCell.self)
        imageCell.configure(viewModel.cellViewModelForIndexPath(indexPath))
        return imageCell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if viewModel.shouldPaginate(row: indexPath.row) { spinner.startAnimating() }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let imageModel = viewModel.cellViewModelForIndexPath(indexPath)
        return CGFloat(imageModel.image.previewHeight) + 20
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = FullScreenImageViewController.instantiate(fromAppStoryboard: .Main)
        controller.viewModel = FullScreenImageViewModel(images: viewModel.allImages(), index: indexPath.row)
        push(vc: controller)
    }
}
