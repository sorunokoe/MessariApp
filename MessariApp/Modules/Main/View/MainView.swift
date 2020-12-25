//
//  MainView.swift
//  MessariApp
//
//  Created by Yeskendir Salgara on 25.12.2020.
//

import UIKit

class MainView: BaseView {
    
    lazy var greetingView: GreetingView = GreetingView()
    lazy var refreshControl: UIRefreshControl = UIRefreshControl()
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.refreshControl = refreshControl
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.register(AssetTileCollectionCell.self,
                                forCellWithReuseIdentifier: MainDataSource.CellIdentifier.tileCellId.rawValue)
        collectionView.register(AssetListCollectionCell.self,
                                forCellWithReuseIdentifier: MainDataSource.CellIdentifier.listCellId.rawValue)
        collectionView.register(MainHeader.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: MainDataSource.CellIdentifier.headerId.rawValue)
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
}
private extension MainView {
    func configure() {
        collectionView.contentInset = UIEdgeInsets(top: 130, left: 0, bottom: 0, right: 0)
        self.backgroundColor = UIColor(color: .background)
        self.addSubview(greetingView)
        self.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        greetingView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(-150)
            $0.width.equalTo(500)
            $0.height.equalTo(500)
        }
        refreshControl.tintColor = UIColor(color: .textLabel)
        refreshControl.translatesAutoresizingMaskIntoConstraints = false
        refreshControl.snp.makeConstraints {
            $0.centerX.equalTo(greetingView.brandImageView.snp.centerX)
            $0.centerY.equalTo(greetingView.brandImageView.snp.centerY)
        }
    }
}
