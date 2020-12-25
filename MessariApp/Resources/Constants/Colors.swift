//
//  Colors.swift
//  MessariApp
//
//  Created by Yeskendir Salgara on 25.12.2020.
//

import UIKit
import Hue

enum Colors {
    
    case textLabel
    case description
    case background
    case darkedBackground
    case tile
    case blue
    
    var darkTheme: UIColor {
        switch self {
        case .textLabel:
            return UIColor(hex: "#FFFFFF")
        case .description:
            return UIColor(hex: "#CFCFCF")
        case .background:
            return UIColor(hex: "#2A2C3F")
        case .tile:
            return UIColor(hex: "#2D3045")
        case .blue:
            return UIColor(hex: "#3B91E3")
        case .darkedBackground:
            return UIColor(hex: "#1E2034")
        }
    }
    
}
