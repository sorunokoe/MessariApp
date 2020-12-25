//
//  AssetDetailProtocols.swift
//  MessariApp
//
//  Created by Yeskendir Salgara on 25.12.2020.
//

import UIKit

protocol AssetDetailRouterProtocol {
    
}
protocol AssetDetailViewControllerProtocol: UIViewController {
    var router: AssetDetailRouterProtocol { get }
    var viewModel: AssetDetailViewModelProtocol { get }
    var customView: AssetDetailView { get }
}
protocol AssetDetailViewModelProtocol: BaseViewModel {
    var asset: AssetData { get }
    var metrics: Box<[Double]> { get }
    var start: Date { get }
    var end: Date { get }
    func getMetrics()
}
