//
//  MainDataSource.swift
//  MessariApp
//
//  Created by Yeskendir Salgara on 25.12.2020.
//

import UIKit

class MainDataSource {
    
    static let itemsInRows: CGFloat = 3
    static let spacing: CGFloat = 16
    static let limit = 20
    
    enum Section {
        case assets
    }
    enum CellIdentifier: String {
        case headerId
        case tileCellId
        case listCellId
    }
    
}
