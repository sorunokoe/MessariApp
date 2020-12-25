//
//  AssetDetailInfoCollectionCell.swift
//  MessariApp
//
//  Created by Yeskendir Salgara on 25.12.2020.
//

import UIKit

class AssetDetailInfoCollectionCell: UICollectionViewCell {
    
    var linkButtons: [UIButton] = []
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(color: .textLabel)
        label.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        return label
    }()
    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    lazy var codeLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(color: .textLabel)
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(color: .blue)
        return view
    }()
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(color: .textLabel)
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    lazy var titleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 13
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        return stackView
    }()
    lazy var linkStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 13
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        return stackView
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
        linkButtons.removeAll()
        linkStackView.arrangedSubviews.forEach {
            linkStackView.removeArrangedSubview($0)
        }
        titleLabel.text = asset.name
        codeLabel.text = asset.symbol
        logoImageView.loadImage(id: asset.id, size: .big)
        if let price = asset.metrics?.market_data?.price_usd {
            priceLabel.text = price.toStringWith(currency: "$")
        }
        if let links = asset.profile?.relevant_resources {
            generate(links: links)
        }
    }
}
private extension AssetDetailInfoCollectionCell {
    func generate(links: [AssetLink]) {
        links.enumerated().forEach { (index, link) in
            if let type = link.type {
                let button = UIButton()
                button.tag = index
                let image = UIImage(named: type.rawValue.lowercased())
                button.setImage(image, for: .normal)
                linkButtons.append(button)
                linkStackView.addArrangedSubview(button)
            }
        }
    }
    func configure() {
        self.contentView.backgroundColor = .clear
        titleStackView.addArrangedSubview(titleLabel)
        titleStackView.addArrangedSubview(logoImageView)
        titleStackView.addArrangedSubview(codeLabel)
        self.contentView.addSubview(titleStackView)
        self.contentView.addSubview(separatorView)
        self.contentView.addSubview(priceLabel)
        self.contentView.addSubview(linkStackView)
        titleStackView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.height.equalTo(32)
        }
        separatorView.snp.makeConstraints {
            $0.top.equalTo(titleStackView.snp.bottom).offset(8)
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.height.equalTo(2)
        }
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(separatorView.snp.bottom).offset(8)
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.height.equalTo(20)
        }
        linkStackView.snp.makeConstraints {
            $0.top.equalTo(priceLabel.snp.bottom).offset(16)
            $0.left.equalToSuperview()
            $0.height.equalTo(24)
        }
        logoImageView.snp.makeConstraints {
            $0.width.equalTo(32)
            $0.height.equalTo(32)
        }
    }
}
