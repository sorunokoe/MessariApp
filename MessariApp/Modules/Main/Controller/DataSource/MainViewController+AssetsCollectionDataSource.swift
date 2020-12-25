//
//  MainViewController+AssetsCollectionDataSource.swift
//  MessariApp
//
//  Created by Yeskendir Salgara on 25.12.2020.
//

import UIKit

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.assets.value.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if self.viewModel.assets.value.count-1 == indexPath.item {
            viewModel.nextPage()
        }
        
        let asset = self.viewModel.assets.value[indexPath.item]
        let tileCellId = MainDataSource.CellIdentifier.tileCellId.rawValue
        let listCellId = MainDataSource.CellIdentifier.listCellId.rawValue
        if indexPath.item < 6,
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: tileCellId,
                                                         for: indexPath) as? AssetTileCollectionCell {
            cell.set(asset: asset)
            return cell
        } else if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: listCellId,
                                                                for: indexPath) as? AssetListCollectionCell {
            cell.set(asset: asset)
            return cell
        }
        return UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader else {
            return UICollectionReusableView()
        }
        let id = MainDataSource.CellIdentifier.headerId.rawValue
        let kind = UICollectionView.elementKindSectionHeader
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                         withReuseIdentifier: id,
                                                                         for: indexPath) as! MainHeader
        if !viewModel.assets.value.isEmpty {
            headerView.titleLabel.text = "Assets"
        }
        
        return headerView
    }
}
