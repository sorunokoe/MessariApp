//
//  AssetDetailDataSource.swift
//  MessariApp
//
//  Created by Yeskendir Salgara on 25.12.2020.
//

import UIKit

extension AssetDetailViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return AssetDetailDataSource.sections.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = AssetDetailDataSource.sections[indexPath.section]
        switch section {
        case .info:
            let id = AssetDetailDataSource.CellIdentificator.infoId.rawValue
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: id,
                                                          for: indexPath) as! AssetDetailInfoCollectionCell
            cell.set(asset: self.viewModel.asset)
            cell.linkButtons.forEach {
                $0.addTarget(self, action: #selector(openLink), for: .touchUpInside)
            }
            return cell
        case .chart:
            let id = AssetDetailDataSource.CellIdentificator.chardId.rawValue
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: id,
                                                          for: indexPath) as! AssetDetailChartCollectionCell
            cell.set(asset: self.viewModel.asset,
                     metrics: self.viewModel.metrics.value,
                     start: self.viewModel.start,
                     end: self.viewModel.end)
            return cell
        case .tagline:
            let id = AssetDetailDataSource.CellIdentificator.taglineId.rawValue
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: id,
                                                          for: indexPath) as! AssetDetailTaglineCollectionCell
            cell.set(asset: self.viewModel.asset)
            return cell
        }
    }
}
