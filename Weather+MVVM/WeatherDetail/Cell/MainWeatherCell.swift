//
//  WeatherMainCell.swift
//  Weather+MVVM
//
//  Created by 양승혜 on 7/15/24.
//

import UIKit
import SnapKit

class MainWeatherCell: BaseTableViewCell {
    private let cityLabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 34)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    override func configureHierarchy() {
        [cityLabel].forEach { contentView.addSubview($0) }
    }
    
    override func configureLayout() {
        cityLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.centerX.equalToSuperview()
        }
    }
    
    func configureUI(cityName: String) {
        cityLabel.text = cityName
    }
}
