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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setElements()
    }
    
    @IBAction func signUpPressed(_ sender: UIButton) {
    }
}


extension SignUpViewController {
    func setElements() {
        // hide the error lable
        errorLabel.alpha = 0
        
        // styling the elements
        StyleUtilities.styleTextField(textField: firstNameTextField)
        StyleUtilities.styleTextField(textField: lastNameTextField)
        StyleUtilities.styleTextField(textField: emailTextField)
        StyleUtilities.styleTextField(textField: passwordTextField)
        StyleUtilities.styleFilledButton(button: signUpButton)
    }
}
