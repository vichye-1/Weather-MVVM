//
//  DailyTableViewCell.swift
//  Weather+MVVM
//
//  Created by 양승혜 on 7/12/24.
//

import UIKit
import SnapKit
import Kingfisher

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
        return view
    }()
    private let lowTemperatureLabel = {
        let label = UILabel()
        label.textColor = .gray
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20)
        label.backgroundColor = .blue
        return label
    }()
    private let highTemperatureLabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 20)
        label.backgroundColor = .systemYellow
        return label
    }()
    
    // MARK: - configure funcs
    override func configureHierarchy() {
        [dayLabel, iconImageView, lowTemperatureLabel, highTemperatureLabel].forEach { contentView.addSubview($0) }
    }
    
    override func configureLayout() {
        dayLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(contentView.safeAreaLayoutGuide).offset(20)
            make.width.equalTo(30)
        }
        iconImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(dayLabel.snp.trailing).offset(8)
            make.width.height.equalTo(40)
        }
        lowTemperatureLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(iconImageView.snp.trailing).offset(8)
        }
        highTemperatureLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(lowTemperatureLabel.snp.trailing).offset(8)
            make.trailing.lessThanOrEqualTo(contentView).inset(16)
        }
    }
    // MARK: - other functions
    func configureUI(day: String, icon: String, low: String, high: String) {
        dayLabel.text = day
        let iconUrl = APIURL.icon(icon: icon)
        iconImageView.kf.setImage(with: URL(string: iconUrl.urlString))
        lowTemperatureLabel.text = "최저 \(low)"
        highTemperatureLabel.text = "최고 \(high)"
    }
}
