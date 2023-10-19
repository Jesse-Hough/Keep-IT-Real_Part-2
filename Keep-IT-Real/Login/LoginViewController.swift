//
//  LoginViewController.swift
//  Keep-IT-Real
//
//  Created by Jesse Hough on 10/09/23.
//

import UIKit
import ParseSwift

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onLoginTapped(_ sender: Any) {

        guard let username = usernameField.text,
              let password = passwordField.text,
              !username.isEmpty,
              !password.isEmpty else {

            showMissingFieldsAlert()
            return
        }

        User.login(username: username, password: password) { [weak self] result in

            switch result {
            case .success(let user):
                print("User: \(user) has logged in")
                NotificationCenter.default.post(name: Notification.Name("login"), object: nil)

            case .failure(let error):
                self?.showAlert(description: error.localizedDescription)
            }
        }
    }

    private func showMissingFieldsAlert() {
        let alertController = UIAlertController(title: "Whoopsie Dasies!", message: "All fields must be filled out!", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)
        present(alertController, animated: true)
    }
}

