//
//  SignUpAndLoginExtention.swift
//  Upstate
//
//  Created by Jose Alarcon Chacon on 1/19/22.
//

import Foundation
import UIKit

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

    // check the fiels and validate that the data is correct
    func fielsValitation() -> String? {
        // check if all fields is filled
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Fill in all of the fields"
        }
        // check if the password is secure
        let securePassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if FormUtilities.isValidPassword(password: securePassword) == false {
            // passwod is not secure enough
            return "Make sure your passwod is at least 8 charactes long"
        }
        return nil
    }
    
    func showError(message: String) {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    func transitionToHomePage() {
        let townViewController = storyboard?.instantiateViewController(withIdentifier: Constants.StoryBoardContainer.townPageViewController) as? TownViewController
        view.window?.rootViewController = townViewController
        view.window?.makeKeyAndVisible()
    }
}

extension LoginViewController {
    func showError(message: String) {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    func transitionToHomePage() {
        let townViewController = storyboard?.instantiateViewController(withIdentifier: Constants.StoryBoardContainer.townPageViewController) as? TownViewController
        view.window?.rootViewController = townViewController
        view.window?.makeKeyAndVisible()
    }
}
