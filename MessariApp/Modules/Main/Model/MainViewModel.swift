//
//  MainViewModel.swift
//  MessariApp
//
//  Created by Yeskendir Salgara on 25.12.2020.
//

import Foundation
import Moya

class MainViewModel: BaseViewModel, MainViewModelProtocol {
    
    private var currentPage = 1
    private var isEnded = false
    var assets: Box<[AssetData]> = Box([])
    private var provider: MoyaProvider<AssetsService> = MoyaProvider<AssetsService>(
        plugins: [NetworkLoggerPlugin()]
    )
    
    func update() {
        currentPage = 1
        isEnded = false
        getAssets()
    }
    func nextPage() {
        currentPage += 1
        getAssets()
    }
    func getAssets() {
        guard !self.isEnded else { return }
        self.loading.value = true
        provider.request(.getAssets(page: currentPage, limit: MainDataSource.limit)) { (result) in
            self.loading.value = false
            switch result {
            case .success(let response):
                if let asset: AssetResponse = try? response.map(AssetResponse.self) {
                    if let message = asset.status?.error_message {
                        self.error.value = message
                    }
                    if (asset.data ?? []).isEmpty {
                        self.isEnded = true
                    } else {
                        self.clearAssetsIfNeeded()
                        self.assets.value.append(contentsOf: asset.data ?? [])
                    }
                } else {
                    self.error.value = "Serialization error. Please, try later.."
                }
            case .failure(let error):
                self.error.value = error.localizedDescription
            }
        }
    }
    
    private func clearAssetsIfNeeded() {
        if currentPage == 1 {
            self.assets.value = []
        }
    }
    
}
