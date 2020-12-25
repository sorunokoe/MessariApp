//
//  AssetLink.swift
//  MessariApp
//
//  Created by Yeskendir Salgara on 25.12.2020.
//

import Foundation

enum AssetLinkType: String {
    case website = "Website",
         whitepaper = "Whitepaper",
         twitter = "Twitter",
         github = "Github",
         reddit = "Reddit",
         telegram = "Telegram"
}
struct AssetLink: Decodable {
    var name: String
    var url: String
    var type: AssetLinkType?
    
    enum CodingKeys: CodingKey {
        case name, url
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        url = try container.decode(String.self, forKey: .url)
        type = AssetLinkType(rawValue: name)
    }
}
