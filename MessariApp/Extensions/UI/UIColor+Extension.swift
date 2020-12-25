//
//  UIColor+Extension.swift
//  MessariApp
//
//  Created by Yeskendir Salgara on 25.12.2020.
//

import UIKit

extension UIColor {
    convenience init(color: Colors) {
        self.init { traitCollection in
            if traitCollection.userInterfaceStyle == .dark {
                return color.darkTheme
            }
            return color.darkTheme
        }
    }
}
