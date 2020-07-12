//
//  BaseViewController.swift
//  WynkImageSearch
//
//  Created by Aashima Anand on 11/07/20.
//  Copyright © 2020 personal. All rights reserved.
//

import UIKit

//BaseViewController
class BaseViewController: UIViewController {
    // MARK: - COMPUTED PROPERTIES
    /// override this to set customized status bar appearance in different view controllers
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - INITIALIZER
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
    }
    
    // MARK: - FUNCTIONS
    /// hides the navigation controller
    func hideNavBar() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    /// unhides the navigation controller
    func showNavBar() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    /// pushes a vc on the navigation controller stack
    func push(vc: UIViewController, animate: Bool = true) {
        self.navigationController?.pushViewController(vc, animated: animate)
    }
    /// pops the topmost vc on the navigation controller stack
    func pop(animate: Bool = true) {
        self.navigationController?.popViewController(animated: animate)
    }
    /// Hides keyboard on tap outside
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    /// Shows informative alert
    func showAlert(_ title: String, _ msg : String, completion : (() -> Swift.Void)? = nil) {
        let alertViewController = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: LocalizedString.ok.localized, style: UIAlertAction.Style.default) { (action : UIAlertAction) -> Void in
            completion?()
            
            alertViewController.dismiss(animated: true, completion: nil)
        }
        alertViewController.addAction(okAction)
        present(alertViewController, animated: true, completion: nil)
    }
}

