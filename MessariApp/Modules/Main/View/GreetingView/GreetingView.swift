//
//  GreetingView.swift
//  MessariApp
//
//  Created by Yeskendir Salgara on 25.12.2020.
//

import UIKit

class GreetingView: UIView {
    
    lazy var brandImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "messari")
        return imageView
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
private extension GreetingView {
    func configure() {
        generateCircles()
        self.addSubview(brandImageView)
        brandImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.width.equalTo(36)
            $0.height.equalTo(36)
        }
    }
    func generateCircles() {
        [450.0, 300.0, 120.0].forEach { (width) in
            let view = UIView(frame: CGRect(x: 0, y: 0, width: width, height: width))
            view.alpha = 0.25
            view.backgroundColor = UIColor(color: .darkedBackground)
            view.layer.cornerRadius = CGFloat(width/2)
            self.addSubview(view)
            view.snp.makeConstraints {
                $0.centerX.equalToSuperview()
                $0.centerY.equalToSuperview()
                $0.width.equalTo(width)
                $0.height.equalTo(width)
            }
        }
    }
}
