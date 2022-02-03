//
//  LoginViewController.swift
//  Upstate
//
//  Created by Jose Alarcon Chacon on 1/18/22.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setElements()
    }
    @IBAction func loginPressed(_ sender: UIButton) {
        // Validate the fields
        
        // signin the user
        signinUser()
    }
}

extension LoginViewController {
    func signinUser() {
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                self.showError(message: error!.localizedDescription)
            } else {
                // transition to home page
                self.transitionToHomePage()
            }
        }
    }
}

extension LoginViewController {
    func setElements() {
        // hide the error lable
        errorLabel.alpha = 0
        
        // styling the elements
        StyleUtilities.styleTextField(textField: emailTextField)
        StyleUtilities.styleTextField(textField: passwordTextField)
        StyleUtilities.styleFilledButton(button: loginButton)
    }
}
