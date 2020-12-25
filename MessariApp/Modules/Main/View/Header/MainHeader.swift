//
//  MainHeader.swift
//  MessariApp
//
//  Created by Yeskendir Salgara on 25.12.2020.
//

import UIKit
import SnapKit

class MainHeader: UICollectionReusableView {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
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
    
}
private extension MainHeader {
    func configure() {
        self.addSubview(titleLabel)
        
        self.backgroundColor = .clear
        
        titleLabel.snp.makeConstraints {
            $0.left.equalToSuperview().offset(20)
            $0.centerY.equalToSuperview()
            $0.right.equalToSuperview().offset(-20)
        }
        
    }
}
