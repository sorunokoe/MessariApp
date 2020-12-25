//
//  MarketData.swift
//  MessariApp
//
//  Created by Yeskendir Salgara on 25.12.2020.
//

import Foundation

struct MarketData: Decodable {
    var price_usd: Double
    
    enum CodingKeys: CodingKey {
        case price_usd
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        price_usd = try container.decode(Double.self, forKey: .price_usd)
    }
}
