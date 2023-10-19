//
//  ViewController+Extensions.swift
//  Keep-IT-Real
//
//  Created by Jesse Hough on 10/09/23.
//

import UIKit

extension UIViewController {

    func showAlert(description: String? = nil) {
        let alertController = UIAlertController(title: "Whoopsie Dasies!", message: "\(description ?? "Unknown error!")", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)
        present(alertController, animated: true)
    }
}
