//
//  FormUtilities.swift
//  Upstate
//
//  Created by Jose Alarcon Chacon on 1/18/22.
//

import Foundation
import UIKit

class FormUtilities {
    static func isValidPassword(password: String) -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[]$@$#!%*?&)[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
}
