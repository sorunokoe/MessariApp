//
//  AssetDetailView.swift
//  MessariApp
//
//  Created by Yeskendir Salgara on 25.12.2020.
//

import UIKit

class AssetDetailView: BaseView {
    
    lazy var greetingView: GreetingView = {
        let view = GreetingView()
        view.brandImageView.isHidden = true
        return view
    }()
    lazy var refreshControl: UIRefreshControl = UIRefreshControl()
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.refreshControl = refreshControl
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.register(AssetDetailInfoCollectionCell.self,
                                forCellWithReuseIdentifier: AssetDetailDataSource.CellIdentificator.infoId.rawValue)
        collectionView.register(AssetDetailChartCollectionCell.self,
                                forCellWithReuseIdentifier: AssetDetailDataSource.CellIdentificator.chardId.rawValue)
        collectionView.register(AssetDetailTaglineCollectionCell.self,
                                forCellWithReuseIdentifier: AssetDetailDataSource.CellIdentificator.taglineId.rawValue)
        
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
private extension AssetDetailView {
    func configure() {
        self.backgroundColor = UIColor(color: .background)
        self.addSubview(greetingView)
        self.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        greetingView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(200)
            $0.width.equalTo(500)
            $0.height.equalTo(500)
        }
        refreshControl.tintColor = UIColor(color: .textLabel)
    }
}
