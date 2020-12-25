//
//  AssetDetailViewModel.swift
//  MessariApp
//
//  Created by Yeskendir Salgara on 25.12.2020.
//

import UIKit
import Moya

class AssetDetailViewModel: BaseViewModel, AssetDetailViewModelProtocol {
    
    var start: Date
    var end: Date
    
    var asset: AssetData
    var metrics: Box<[Double]> = Box([])
    private var provider: MoyaProvider<AssetsService> = MoyaProvider<AssetsService>(
        plugins: [NetworkLoggerPlugin()]
    )
    
    init(asset: AssetData) {
        self.asset = asset
        self.start = Date().addingTimeInterval(-2*24*60*60)
        self.end = Date().addingTimeInterval(-1*24*60*60)
    }
    
    func getMetrics() {
        self.loading.value = true
        provider.request(.getMetrics(id: self.asset.id,
                                     type: "price",
                                     start: start.convertToString(),
                                     end: end.convertToString())) { (result) in
            self.loading.value = false
            switch result {
            case .success(let response):
                if let asset: AssetMetricsReponse = try? response.map(AssetMetricsReponse.self) {
                    if let message = asset.status?.error_message {
                        self.error.value = message
                    }
                    let metrics = asset.data?.values?.first ?? []
                    if !metrics.isEmpty, metrics.count > 2 {
                        let data = Array(metrics[1..<metrics.count-1])
                        self.metrics.value = data
                    }
                } else {
                    self.error.value = "Serialization error. Please, try later.."
                }
            case .failure(let error):
                self.error.value = error.localizedDescription
            }
        }
    }
}
