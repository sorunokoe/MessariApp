//
//  Date+Extension.swift
//  MessariApp
//
//  Created by Yeskendir Salgara on 26.12.2020.
//

import Foundation

extension Date {
    func convertToString() -> String {
        return convert(toDateFormat: "yyyy-MM-dd")
    }
    func convert(toDateFormat: String) -> String {
        let toDateFormatter = DateFormatter()
        toDateFormatter.dateFormat = toDateFormat
        let newDateString = toDateFormatter.string(from: self)
        return newDateString
    }
}
