//
//  Environment.swift
//  MessariApp
//
//  Created by Yeskendir Salgara on 25.12.2020.
//

import Foundation

enum EnvironmentState {
    case development, production
    
    var baseAPIURL: String {
        switch self {
        case .development:
            return "https://data.messari.io"
        default:
            return "https://data.messari.io"
        }
    }
    var baseURL: String {
        switch self {
        case .development:
            return "https://messari.io"
        default:
            return "https://messari.io"
        }
    }
    
    // TODO: Vulnerable information - remove
    var apiKey: String {
        return "7408ce3c-a0a0-4c2d-84dc-01289c77caed"
    }
    
}

struct Environment {
    
    static var state: EnvironmentState = .production
    static func isDebug() -> Bool {
        return state == .development
    }
    
}
