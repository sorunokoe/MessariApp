//
//  AssetMetric.swift
//  MessariApp
//
//  Created by Yeskendir Salgara on 25.12.2020.
//

import Foundation

struct AssetMetric: Decodable {
    var market_data: MarketData?
    
    enum CodingKeys: CodingKey {
        case market_data
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        market_data = try? container.decode(MarketData.self, forKey: .market_data)
    }
}
