//
//  SignUpViewController.swift
//  Upstate
//
//  Created by Jose Alarcon Chacon on 1/18/22.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    var getExtention = SignUpandLoginExtention()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getExtention.setElements()
    }
    
    @IBAction func signUpPressed(_ sender: UIButton) {
        // Validate the fields
        let error = getExtention.fielsValitation()
        if error != nil {
            getExtention.showError(message: error!)
        } else {
            // create user
        }
    }
}

