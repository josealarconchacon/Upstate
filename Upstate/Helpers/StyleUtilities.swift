//
//  Utilities.swift
//  Upstate
//
//  Created by Jose Alarcon Chacon on 1/18/22.
//

import Foundation
import UIKit

class StyleUtilities {
    static func styleTextField(textField: UITextField) {
        // set the botton line
        let textFiedBottonLine = CALayer()
        textFiedBottonLine.frame = CGRect(x: 0, y: textField.frame.height - 0.5, width: textField.frame.width, height: 0.5)
        textFiedBottonLine.backgroundColor = UIColor(red: 0/255, green: 140/255, blue: 125/255, alpha: 1.0).cgColor
        
        // remove textField border
        textField.borderStyle = .none
        textField.layer.addSublayer(textFiedBottonLine)
    }
    
    static func styleFilledButton(button: UIButton) {
        button.backgroundColor = UIColor(red: 0/255, green: 140/255, blue: 125/255, alpha: 1.0)
        button.layer.cornerRadius = 25.0
        button.tintColor = .white
    }
    
    static func styleHollowButton(button: UIButton) {
        // rounded corner style
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 25.0
        button.tintColor = .black
    }
}
