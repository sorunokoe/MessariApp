//
//  MainProtocols.swift
//  MessariApp
//
//  Created by Yeskendir Salgara on 25.12.2020.
//

import UIKit

enum MainRoutes {
    case detailWith(asset: AssetData)
}
protocol MainViewControllerProtocol: UIViewController {
    var router: MainRouterProtocol { get }
    var customView: MainView { get }
    var viewModel: MainViewModelProtocol { get }
}
protocol MainViewModelProtocol: BaseViewModel {
    var assets: Box<[AssetData]> { get }
    func getAssets()
    func update()
    func nextPage()
}
protocol MainRouterProtocol {
    func navigate(to: MainRoutes)
}
