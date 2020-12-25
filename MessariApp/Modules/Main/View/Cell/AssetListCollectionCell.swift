//
//  AssetListCollectionCell.swift
//  MessariApp
//
//  Created by Yeskendir Salgara on 25.12.2020.
//

import UIKit

class AssetListCollectionCell: UICollectionViewCell {
    
    lazy var areaView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(color: .background)
        view.layer.cornerRadius = 16.0
        return view
    }()
    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = UIColor(color: .description)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor(color: .textLabel)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .right
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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        clear()
    }
    
    // MARK: - Public methods
    func set(asset: AssetData) {
        self.iconImageView.loadImage(id: asset.id, size: .regular)
        self.titleLabel.text = asset.name
        if let price = asset.metrics?.market_data?.price_usd {
            self.priceLabel.text = price.toStringWith(currency: "$")
        }
    }
    
}
private extension AssetListCollectionCell {
    func clear() {
        iconImageView.image = nil
        titleLabel.text = nil
        priceLabel.text = nil
    }
    func configure() {
        self.contentView.layer.cornerRadius = 16.0
        self.contentView.backgroundColor = UIColor(color: .tile)
        self.contentView.addSubview(areaView)
        [iconImageView, titleLabel, priceLabel].forEach {
            areaView.addSubview($0)
        }
        areaView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.left.equalToSuperview().offset(10)
            $0.right.equalToSuperview().offset(-10)
            $0.bottom.equalToSuperview().offset(-10)
        }
        iconImageView.snp.makeConstraints {
            $0.left.equalToSuperview().offset(10)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(32)
            $0.height.equalTo(32)
        }
        titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalTo(iconImageView.snp.right).offset(16)
            $0.right.equalTo(priceLabel.snp.left).offset(-5)
            $0.height.equalTo(15)
        }
        priceLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.right.equalToSuperview().offset(-10)
            $0.height.equalTo(15)
            $0.width.equalTo(100)
        }
    }
}
