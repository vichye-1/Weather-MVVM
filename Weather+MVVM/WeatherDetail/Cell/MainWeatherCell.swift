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
    private let temperatureLabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 64)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    override func configureHierarchy() {
        [cityLabel, temperatureLabel].forEach { contentView.addSubview($0) }
    }
    
    override func configureLayout() {
        cityLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.centerX.equalToSuperview()
        }
        temperatureLabel.snp.makeConstraints { make in
            make.top.equalTo(cityLabel.snp.bottom)
            make.centerX.equalToSuperview()
        }
    }
    
    func configureUI(cityName: String, temperature: String) {
        cityLabel.text = cityName
        temperatureLabel.text = temperature
    }
}
