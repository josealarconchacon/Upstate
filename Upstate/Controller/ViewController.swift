//
//  ViewController.swift
//  Upstate
//
//  Created by Jose Alarcon Chacon on 1/17/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setElements()
    }
}

extension ViewController {
    func setElements() {
        StyleUtilities.styleFilledButton(button: signUpButton)
        StyleUtilities.styleHollowButton(button: loginButton)
    }
}
