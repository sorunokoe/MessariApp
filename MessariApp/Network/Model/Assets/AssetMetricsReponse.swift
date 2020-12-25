//
//  AssetMetricsReponse.swift
//  MessariApp
//
//  Created by Yeskendir Salgara on 26.12.2020.
//
import Foundation

struct AssetMetricsReponse: Decodable {
    var status: Status?
    var data: AssetData?
    
    enum CodingKeys: CodingKey {
        case status, data
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        status = try? container.decode(Status.self, forKey: .status)
        data = try? container.decode(AssetData.self, forKey: .data)
    }
    
}
