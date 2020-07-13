//
//  FullScreenImageViewController.swift
//  WynkImageSearch
//
//  Created by Aashima Anand on 12/07/20.
//  Copyright © 2020 personal. All rights reserved.
//

import UIKit

// FullScreenImageViewModel
final class FullScreenImageViewModel {
    private var images: [Image] = []
    var urlJumpedTo: String {
        return images[currentIndex].largeImageURL
    }
    var previousBtnImage = AppImages.backwardArrow.image
    var nextBtnImage = AppImages.forwardArrow.image
    private var currentIndex: Int = 0
    var pageTitle: String {
        return LocalizedString.fullScreen.localized
    }
    init(images: [Image], index: Int) {
        self.images = images
        self.currentIndex = index
    }
    /// tells whether any previous image exists
    func hasPrevious() -> Bool {
        return currentIndex - 1 >= 0
    }
    /// tells whether any next image exists
    func hasNext() -> Bool {
        return currentIndex + 1 <= images.count - 1
    }
    /// returns previous image
    func fetchPrevious() -> String {
        currentIndex -= 1
        return images[currentIndex].largeImageURL
    }
    /// returns next image
    func fetchNext() -> String {
        currentIndex += 1
        return images[currentIndex].largeImageURL
    }
}

// FullScreenImageViewController
class FullScreenImageViewController:  BaseViewController {
    // MARK: - IBOUTLETS
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    // MARK: - STORED PROPERTIES
    var viewModel: FullScreenImageViewModel!
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
        imgView.sdSetImage(imageString: viewModel.urlJumpedTo, placeHolderImage: AppImages.imgPlaceholder.image)
        previousButton.setImage(viewModel.previousBtnImage, for: .normal)
        nextButton.setImage(viewModel.nextBtnImage, for: .normal)
    }
    // MARK: - IBACTIONS
    
    @IBAction func nextTapped(_ sender: UIButton) {
        if viewModel.hasNext() {
            imgView.sdSetImage(imageString: viewModel.fetchNext(), placeHolderImage: AppImages.imgPlaceholder.image)
        }
    }
    @IBAction func previousTapped(_ sender: UIButton) {
        if viewModel.hasPrevious() {
            imgView.sdSetImage(imageString: viewModel.fetchPrevious(), placeHolderImage: AppImages.imgPlaceholder.image)
        }
    }
}
// MARK: - EXTENSIONS
extension FullScreenImageViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imgView
    }
}
