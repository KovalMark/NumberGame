//
//  extension+UIViewController.swift
//  NumberGame
//
//  Created by Марк Коваль on 22/06/2022.
//

import UIKit

//MARK: Hide keyboard
extension UIViewController {
    
    func hideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
