//
//  LandingViewController.swift
//  WynkImageSearch
//
//  Created by Aashima Anand on 11/07/20.
//  Copyright © 2020 personal. All rights reserved.
//

import UIKit

// LandingViewController
class LandingViewController: BaseViewController {
    // MARK: - IBOUTLETS
    @IBOutlet weak var bgImgView: UIImageView!
    @IBOutlet weak var continueBtn: UIButton!
    // MARK: - STORED PROPERTIES
    private var viewModel: LandingViewModel!

    // MARK: - COMPUTED PROPERTIES
    // MARK: - INITIALIZER
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = LandingViewModel()
        setUpView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hideNavBar()
    }
    // MARK: - FUNCTIONS
    private func setUpView() {
        setTitle()
        setFonts()
        setColors()
        bgImgView.image = viewModel.bgImg.image
    }
    private func setTitle() {
        continueBtn.setTitle(LocalizedString.continueText.localized, for: .normal)
    }
    
    // MARK: - IBACTIONS
    
    @IBAction func continueTapped(_ sender: UIButton) {
        let controller = SearchViewController.instantiate(fromAppStoryboard: .Main)
        controller.viewModel = SearchViewModel(networkManager: NetworkManager(), delegate: controller)
        push(vc: controller)
    }
    
}

// MARK: - EXTENSIONS

extension LandingViewController: Appearance {
    func setFonts() {
        continueBtn.titleLabel?.font = viewModel.buttonFont.withSize(viewModel.buttonFontSize)
    }
    
    func setColors() {
        continueBtn.setTitleColor(viewModel.buttonTextColor.tint, for: .normal)
    }
    
    
}
