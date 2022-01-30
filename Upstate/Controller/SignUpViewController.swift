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
            // create user
            Auth.auth().createUser(withEmail: "", password: "") { result, error in
                if let error = error {
                    self.showError(message: "Error creating user")
                } else {
                    // User was create successfully
                    // reference to Firestore object
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: <#T##[String : Any]#>, completion: <#T##((Error?) -> Void)?##((Error?) -> Void)?##(Error?) -> Void#>)
                }
            }
        }
    }
}

