//
//  AssetDetailTaglineCollectionCell.swift
//  MessariApp
//
//  Created by Yeskendir Salgara on 25.12.2020.
//

import UIKit

class AssetDetailTaglineCollectionCell: UICollectionViewCell {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = UIColor(color: .description)
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 10
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    func set(asset: AssetData) {
        titleLabel.text = asset.profile?.tagline
    }
}
private extension AssetDetailTaglineCollectionCell {
    func configure() {
        self.contentView.backgroundColor = .clear
        self.contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
        }
    }
}
