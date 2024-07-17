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
        label.backgroundColor = .black
        return label
    }()
    
    private let iconImageView = {
        let view = UIView()
        view.contentMode = .scaleAspectFit
        view.backgroundColor = .orange
        return view
    }()
    private let lowTemperatureLabel = {
        let label = UILabel()
        label.textColor = .gray
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 34)
        label.backgroundColor = .cyan
        return label
    }()
    
    // MARK: - configure funcs
    override func configureHierarchy() {
        [dayLabel, iconImageView, lowTemperatureLabel].forEach { contentView.addSubview($0) }
    }
    
    override func configureLayout() {
        dayLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(contentView.safeAreaLayoutGuide).offset(16)
            make.height.equalTo(30)
            make.width.equalTo(40)
        }
        iconImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(dayLabel.snp.trailing).offset(30)
            make.width.height.equalTo(30)
        }
        lowTemperatureLabel.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
            make.height.equalTo(30)
            make.width.equalTo(100)
        }
    }
}
