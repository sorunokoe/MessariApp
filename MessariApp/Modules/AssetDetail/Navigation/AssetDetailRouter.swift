//
//  AssetDetailRouter.swift
//  MessariApp
//
//  Created by Yeskendir Salgara on 25.12.2020.
//

import UIKit

class AssetDetailRouter: AssetDetailRouterProtocol {
    
    weak var vc: UIViewController?
    
    static func generateWith(asset: AssetData) -> UIViewController {
        let view = AssetDetailView()
        let viewModel = AssetDetailViewModel(asset: asset)
        let router = AssetDetailRouter()
        let vc = AssetDetailViewController(customView: view,
                                           viewModel: viewModel,
                                           router: router)
        router.vc = vc
        return vc
    }
    
}
