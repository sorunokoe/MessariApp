//
//  AssetData.swift
//  MessariApp
//
//  Created by Yeskendir Salgara on 25.12.2020.
//

import Foundation

struct AssetData: Decodable {
    var id: String
    var symbol: String
    var name: String
    var metrics: AssetMetric?
    var profile: AssetProfile?
    
    var values: [[Double]]?
    
    enum CodingKeys: CodingKey {
        case id, symbol, name, metrics, profile, values
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        symbol = try container.decode(String.self, forKey: .symbol)
        name = try container.decode(String.self, forKey: .name)
        metrics = try? container.decode(AssetMetric.self, forKey: .metrics)
        profile = try? container.decode(AssetProfile.self, forKey: .profile)
        values = try? container.decode([[Double]].self, forKey: .values)
    }
    
}
