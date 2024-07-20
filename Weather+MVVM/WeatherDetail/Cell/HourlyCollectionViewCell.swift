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
    
    // MARK: - configure fuctions
    override func configureHierarchy() {
        [timeLabel, iconImageView].forEach { contentView.addSubview($0) }
    }
    
    override func configureLayout() {
        timeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(4)
            make.horizontalEdges.equalToSuperview().inset(8)
            make.height.equalTo(20)
        }
        iconImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(40)
        }
    }
}

