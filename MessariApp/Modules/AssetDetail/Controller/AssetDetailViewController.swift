//
//  AssetDetailViewController.swift
//  MessariApp
//
//  Created by Yeskendir Salgara on 25.12.2020.
//

import UIKit

class AssetDetailViewController: UIViewController, AssetDetailViewControllerProtocol {
    
    var customView: AssetDetailView
    var viewModel: AssetDetailViewModelProtocol
    var router: AssetDetailRouterProtocol
    
    required init(customView: AssetDetailView,
                  viewModel: AssetDetailViewModelProtocol,
                  router: AssetDetailRouterProtocol) {
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
        bind()
        self.viewModel.getMetrics()
    }
    
}
// MARK: - Handlers
extension AssetDetailViewController {
    @objc func update() {
        self.viewModel.getMetrics()
    }
    @objc func openLink(button: UIButton) {
        if let links = self.viewModel.asset.profile?.relevant_resources {
            let link = links[button.tag]
            guard let url = URL(string: link.url) else { return }
            UIApplication.shared.open(url)
        }
    }
}
private extension AssetDetailViewController {
    func bind() {
        viewModel.loading.bind { (value) in
            self.customView.indicator(show: value)
        }
        viewModel.metrics.bind { (_) in
            self.customView.collectionView.reloadData()
            self.customView.refreshControl.endRefreshing()
        }
        customView.refreshControl.addTarget(self, action: #selector(update), for: .valueChanged)
        customView.collectionView.dataSource = self
        customView.collectionView.delegate = self
    }
}
