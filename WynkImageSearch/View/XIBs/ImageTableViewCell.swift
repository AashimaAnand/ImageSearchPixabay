//
//  ImageTableViewCell.swift
//  WynkImageSearch
//
//  Created by Aashima Anand on 12/07/20.
//  Copyright © 2020 personal. All rights reserved.
//

import UIKit

/// View model ImageTableViewCellViemModel
struct ImageTableViewCellViemModel {
    let image: Image
    
}

// ImageTableViewCell
class ImageTableViewCell: UITableViewCell {
    // MARK: - IBOUTLETS
    @IBOutlet weak var imgView: UIImageView!
    // MARK: - STORED PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    // MARK: - INITIALIZER
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    // MARK: - FUNCTIONS
    func configure(_ viewModel: ImageTableViewCellViemModel) {
        imgView.sdSetImage(imageString: viewModel.image.previewURL, placeHolderImage: AppImages.imgPlaceholder.image)
    }
    // MARK: - IBACTIONS
}
// MARK: - EXTENSIONS
