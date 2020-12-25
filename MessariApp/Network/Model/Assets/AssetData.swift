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
    
    enum CodingKeys: CodingKey {
        case id, symbol, name, metrics
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        symbol = try container.decode(String.self, forKey: .symbol)
        name = try container.decode(String.self, forKey: .name)
        metrics = try? container.decode(AssetMetric.self, forKey: .metrics)
    }
    
}
