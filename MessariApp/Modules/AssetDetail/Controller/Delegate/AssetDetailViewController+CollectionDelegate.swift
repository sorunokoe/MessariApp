//
//  AssetDetailViewController+CollectionDelegate.swift
//  MessariApp
//
//  Created by Yeskendir Salgara on 25.12.2020.
//
import UIKit

extension AssetDetailViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {

        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let section = AssetDetailDataSource.sections[indexPath.section]
        let width = collectionView.bounds.width-40
        switch section {
        case .info:
            return CGSize(width: width, height: 150)
        case .chart:
            return CGSize(width: width, height: 400)
        case .tagline:
            return CGSize(width: width, height: 150)
        }
    }
}
