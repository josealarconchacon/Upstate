//
//  LoginViewController.swift
//  Upstate
//
//  Created by Jose Alarcon Chacon on 1/18/22.
//

import UIKit

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
