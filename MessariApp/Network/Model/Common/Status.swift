//
//  Status.swift
//  MessariApp
//
//  Created by Yeskendir Salgara on 25.12.2020.
//

import Foundation

struct Status: Decodable {
    var elapsed: Int
    var timestamp: String
    var error_code: Int?
    var error_message: String?
    
    enum CodingKeys: CodingKey {
        case elapsed, timestamp, error_code, error_message
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        elapsed = try container.decode(Int.self, forKey: .elapsed)
        timestamp = try container.decode(String.self, forKey: .timestamp)
        error_code = try? container.decode(Int.self, forKey: .error_code)
        error_message = try? container.decode(String.self, forKey: .error_message)
    }
}
