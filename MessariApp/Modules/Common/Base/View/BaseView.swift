//
//  BaseView.swift
//  MessariApp
//
//  Created by Yeskendir Salgara on 25.12.2020.
//

import UIKit
import NVActivityIndicatorView

class BaseView: UIView {
    
    private var indicatorView = NVActivityIndicatorView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
}
extension BaseView {
    func showIndicator() {
        self.indicatorView.startAnimating()
    }
    func hideIndicator() {
        self.indicatorView.stopAnimating()
    }
}
private extension BaseView {
    
    func configure() {
        indicatorView.color = UIColor(color: .textLabel)
        indicatorView.type = .ballScaleRippleMultiple
        self.addSubview(indicatorView)
        indicatorView.snp.makeConstraints {
            $0.width.equalTo(40)
            $0.height.equalTo(40)
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
    }
    
}
