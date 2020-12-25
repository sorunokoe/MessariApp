//
//  AssetTileCollectionCell.swift
//  MessariApp
//
//  Created by Yeskendir Salgara on 25.12.2020.
//

import UIKit

class AssetTileCollectionCell: UICollectionViewCell {
    
    lazy var areaStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .center
        view.distribution = .fillProportionally
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
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = UIColor(color: .description)
        return label
    }()
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor(color: .textLabel)
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
        clear()
        super.prepareForReuse()
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
private extension AssetTileCollectionCell {
    func clear() {
        iconImageView.image = nil
        titleLabel.text = nil
        priceLabel.text = nil
    }
    func configure() {
        self.contentView.layer.cornerRadius = 16.0
        self.contentView.backgroundColor = UIColor(color: .tile)
        self.contentView.addSubview(areaStackView)
        [iconImageView, titleLabel, priceLabel].forEach {
            areaStackView.addArrangedSubview($0)
        }
        areaStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(5)
            $0.left.equalToSuperview().offset(5)
            $0.right.equalToSuperview().offset(-5)
            $0.bottom.equalToSuperview().offset(-5)
        }
    }
}
