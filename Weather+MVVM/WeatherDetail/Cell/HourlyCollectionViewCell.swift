//
//  DailyCollectionViewCell.swift
//  Weather+MVVM
//
//  Created by 양승혜 on 7/20/24.
//

import UIKit
import SnapKit

final class HourlyCollectionViewCell: BaseCollectionViewCell {
    private let timeLabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 14)
        label.textAlignment = .center
        label.backgroundColor = .brown
        return label
    }()
    
    private let iconImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .systemYellow
        return imageView
    }()
    
    private let temperatureLabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        label.backgroundColor = .systemCyan
        return label
    }()
    
    // MARK: - configure fuctions
    override func configureHierarchy() {
        [timeLabel, iconImageView, temperatureLabel].forEach { contentView.addSubview($0) }
    }
    
    override func configureLayout() {
        timeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(20)
        }
        iconImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(40)
        }
        temperatureLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(8)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(20)
        }
    }
}

