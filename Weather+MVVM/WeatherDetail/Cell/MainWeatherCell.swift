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
    private let descriptionLabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    private let highlowLabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    override func configureHierarchy() {
        [cityLabel, temperatureLabel, descriptionLabel, highlowLabel].forEach { contentView.addSubview($0) }
    }
    
    override func configureLayout() {
        cityLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.horizontalEdges.equalToSuperview().inset(16)
        }
        temperatureLabel.snp.makeConstraints { make in
            make.top.equalTo(cityLabel.snp.bottom)
            make.horizontalEdges.equalToSuperview().inset(16)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(temperatureLabel.snp.bottom)
            make.horizontalEdges.equalToSuperview().inset(16)
        }
        highlowLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(4)
            make.horizontalEdges.equalToSuperview().inset(16)
        }
    }
    
    func configureUI(cityName: String, temperature: String, description: String, highTemp: String, lowTemp: String) {
        cityLabel.text = cityName
        temperatureLabel.text = temperature
        descriptionLabel.text = description
        highlowLabel.text = "최고 : \(highTemp) | 최저 : \(lowTemp)"
    }
}
