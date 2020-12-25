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
        router.vc = nc
        return nc
    }
    
    func navigate(to: MainRoutes) {
        switch to {
        case .detail:
            break
        }
    }
    
}
