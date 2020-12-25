//
//  Double+Extension.swift
//  MessariApp
//
//  Created by Yeskendir Salgara on 25.12.2020.
//

import Foundation

extension Double {
    
    func toStringWith(currency: String) -> String {
        let formatter = NumberFormatter()
        formatter.currencySymbol = .init("$")
        formatter.numberStyle = .currency
        return formatter.string(from: self as NSNumber) ?? ""
    }
    
}
