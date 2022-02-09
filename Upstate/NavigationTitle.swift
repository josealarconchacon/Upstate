//
//  NavigationTitle.swift
//  Upstate
//
//  Created by Jose Alarcon Chacon on 2/9/22.
//

import Foundation
import UIKit

extension UINavigationItem {
   func enableMultilineTitle() {
      setValue(true, forKey: "__largeTitleTwoLineMode")
   }
}
