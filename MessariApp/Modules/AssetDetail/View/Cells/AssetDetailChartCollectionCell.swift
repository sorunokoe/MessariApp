//
//  AssetDetailChartCollectionCell.swift
//  MessariApp
//
//  Created by Yeskendir Salgara on 25.12.2020.
//

import SwiftUICharts
import UIKit
import SwiftUI

class AssetDetailChartCollectionCell: UICollectionViewCell {

    var lineView: LineView?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.backgroundColor = .clear
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.contentView.backgroundColor = .clear
    }
    
    func set(asset: AssetData,
             metrics: [Double],
             start: Date,
             end: Date) {
        let dateFormat = "yyyy.MM.dd"
        let startValue = start.convert(toDateFormat: dateFormat)
        let endValue = end.convert(toDateFormat: dateFormat)
        let chartStyle = ChartStyle(backgroundColor: .clear,
                                    accentColor: .clear,
                                    gradientColor: GradientColor(start: Color(UIColor(color: .textLabel)),
                                                                 end: Color(UIColor(color: .blue))),
                                    textColor: Color(UIColor(color: .textLabel)),
                                    legendTextColor: Color(UIColor(color: .textLabel)),
                                    dropShadowColor: Color(UIColor(color: .blue)))
        lineView = LineView(data: metrics, title: "Price Chart",
                            legend: "\(asset.name) (\(asset.symbol)-USD) \(startValue) - \(endValue)",
                            style: chartStyle)
        configure()
    }
}
private extension AssetDetailChartCollectionCell {
    func configure() {
        let chartView = UIHostingController(rootView: lineView)
        chartView.view.backgroundColor = .clear
        self.contentView.addSubview(chartView.view)
        chartView.view.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
