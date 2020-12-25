//
//  UIImageView+Extension.swift
//  MessariApp
//
//  Created by Yeskendir Salgara on 25.12.2020.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    enum Size: String {
        case small = "16",
             regular = "32",
             big = "64",
             huge = "128"
    }
    func loadImage(id: String, size: Size) {
        let url = URL(string: "\(Environment.state.baseURL)/asset-images/\(id)/\(size.rawValue).png")
        self.kf.indicatorType = .activity
        self.kf.setImage(
            with: url,
            options: [
                .transition(.fade(1))        
        ])
    }
    
}
