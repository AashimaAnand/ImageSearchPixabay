//
//  UIImageViewExtension.swift
//  WynkImageSearch
//
//  Created by Aashima Anand on 12/07/20.
//  Copyright © 2020 personal. All rights reserved.
//

import UIKit
import SDWebImage

extension UIImageView {
    
    func sdSetImage(imageString: String, placeHolderImage: UIImage, options: SDWebImageOptions = .progressiveLoad, loader: Bool = true, completion: (() -> ())? = {}) {
        sd_setImage(with: URL(string: imageString), placeholderImage: placeHolderImage, options: options) { (image, err, cacheType, url) in
            completion?()
        }
    }
    
}
