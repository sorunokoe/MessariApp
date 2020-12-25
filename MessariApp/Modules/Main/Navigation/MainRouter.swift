//
//  MainRouter.swift
//  MessariApp
//
//  Created by Yeskendir Salgara on 25.12.2020.
//

import UIKit

class MainRouter: MainRouterProtocol {
    
    weak var vc: UINavigationController?
    
    static func generate() -> UIViewController {
        let view = MainView()
        let viewModel = MainViewModel()
        let router = MainRouter()
        let vc = MainViewController(customView: view,
                                    viewModel: viewModel,
                                    router: router)
        let nc = UINavigationController(rootViewController: vc)
        nc.navigationBar.isTranslucent = false
        nc.navigationBar.barTintColor = UIColor(color: .background)
        nc.navigationBar.tintColor = UIColor(color: .blue)
        router.vc = nc
        return nc
    }
    
    func navigate(to: MainRoutes) {
        switch to {
        case .detailWith(let asset):
            let vc = AssetDetailRouter.generateWith(asset: asset)
            self.vc?.pushViewController(vc, animated: true)
        }
    }
    
}
