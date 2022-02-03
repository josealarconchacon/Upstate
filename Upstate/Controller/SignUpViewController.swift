//
//  SignUpViewController.swift
//  Upstate
//
//  Created by Jose Alarcon Chacon on 1/18/22.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore

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
        // Validate the fields
        let error = fielsValitation()
        if error != nil {
            showError(message: error!)
        } else {
            createUser()
        }
    }
}

extension SignUpViewController {
    func createUser() {
        // create user
        let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil {
                self.showError(message: "Error creating user")
            } else {
                // User was create successfully
                // reference to Firestore object
                let db = Firestore.firestore()
                db.collection("users").addDocument(data: ["firstName" : firstName, "lastName" : lastName, "uid": result!.user.uid]) { (error) in
                    if error != nil {
                        self.showError(message: "Error: User could not be save")
                    }
                }
                // transition to home page
                self.transitionToHomePage()
            }
        }
    }
}
