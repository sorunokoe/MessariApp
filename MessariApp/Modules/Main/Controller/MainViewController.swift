//
//  MainViewController.swift
//  MessariApp
//
//  Created by Yeskendir Salgara on 25.12.2020.
//

import UIKit

class MainViewController: UIViewController, MainViewControllerProtocol {
    
    var customView: MainView
    var viewModel: MainViewModelProtocol
    var router: MainRouterProtocol
    
    required init(customView: MainView,
                  viewModel: MainViewModelProtocol,
                  router: MainRouterProtocol) {
        self.customView = customView
        self.viewModel = viewModel
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = customView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        bind()
        viewModel.getAssets()
    }
    
}
// MARK: - Handlers
extension MainViewController {
    @objc func update() {
        self.viewModel.update()
    }
}
private extension MainViewController {
    func bind() {
        customView.refreshControl.addTarget(self, action: #selector(update), for: .valueChanged)
        customView.collectionView.dataSource = self
        customView.collectionView.delegate = self
        viewModel.assets.bind { (_) in
            self.customView.refreshControl.endRefreshing()
            self.customView.collectionView.reloadData()
        }
    }
}
