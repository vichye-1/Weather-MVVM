//
//  DailyTableViewCell.swift
//  Weather+MVVM
//
//  Created by 양승혜 on 7/12/24.
//

import UIKit
import SnapKit

class DailyTableViewCell: BaseTableViewCell {
    private let dayLabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    private let iconImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.backgroundColor = .orange
        return view
    }()
    private let lowTemperatureLabel = {
        let label = UILabel()
        label.textColor = .gray
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    private let highTemperatureLabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    // MARK: - configure funcs
    override func configureHierarchy() {
        [dayLabel, iconImageView, lowTemperatureLabel, highTemperatureLabel].forEach { contentView.addSubview($0) }
    }
    
    override func configureLayout() {
        dayLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(contentView.safeAreaLayoutGuide).offset(16)
            make.height.equalTo(30)
            make.width.equalTo(50)
        }
        iconImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(dayLabel.snp.trailing).offset(20)
            make.width.height.equalTo(30)
        }
        lowTemperatureLabel.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
            make.height.equalTo(30)
            make.width.equalTo(100)
        }
        highTemperatureLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(16)
            make.height.equalTo(30)
            make.width.equalTo(80)
        }
    }
    
    // MARK: - other functions
    func configureUI(day: String, icon: String, low: Double, high: Double) {
        dayLabel.text = day
        iconImageView.image = UIImage(named: icon)
        lowTemperatureLabel.text = "최저 \(low)°"
        highTemperatureLabel.text = "최고 \(high)°"
    }
}
