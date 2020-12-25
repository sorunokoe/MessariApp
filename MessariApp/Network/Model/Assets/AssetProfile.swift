//
//  AssetProfile.swift
//  MessariApp
//
//  Created by Yeskendir Salgara on 25.12.2020.
//

import Foundation

struct AssetProfile: Decodable {
    var tagline: String
    var relevant_resources: [AssetLink]?
    
    enum CodingKeys: CodingKey {
        case tagline, relevant_resources
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        tagline = try container.decode(String.self, forKey: .tagline)
        relevant_resources = try container.decode([AssetLink].self, forKey: .relevant_resources)
    }
}
