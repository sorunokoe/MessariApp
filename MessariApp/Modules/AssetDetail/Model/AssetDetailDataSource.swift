//
//  AssetDetailDataSource.swift
//  MessariApp
//
//  Created by Yeskendir Salgara on 25.12.2020.
//

import Foundation

class AssetDetailDataSource {
    
    static var sections: [Section] = [.info, .chart, .tagline]
    
    enum Section {
        case info, chart, tagline
    }
    
    enum CellIdentificator: String {
        case infoId, chardId, taglineId
    }
    
}
