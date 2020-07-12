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
    var imgUrlStr: String = ""
    var pageTitle: String {
        return LocalizedString.fullScreen.localized
    }
    init(url: String) {
        self.imgUrlStr = url
    }
}

// FullScreenImageViewController
class FullScreenImageViewController:  BaseViewController {
    // MARK: - IBOUTLETS
    @IBOutlet weak var imgView: UIImageView!
    // MARK: - STORED PROPERTIES
    var viewModel: FullScreenImageViewModel!
    // MARK: - COMPUTED PROPERTIES
    // MARK: - INITIALIZER
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = viewModel.pageTitle
        imgView.sdSetImage(imageString: viewModel.imgUrlStr, placeHolderImage: AppImages.imgPlaceholder.image)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showNavBar()
    }
    // MARK: - FUNCTIONS
    // MARK: - IBACTIONS
}
// MARK: - EXTENSIONS
extension FullScreenImageViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imgView
    }
}
