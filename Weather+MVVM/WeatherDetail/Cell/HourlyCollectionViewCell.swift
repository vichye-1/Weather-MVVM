//
//  DailyCollectionViewCell.swift
//  Weather+MVVM
//
//  Created by 양승혜 on 7/20/24.
//

import UIKit
import Kingfisher
import SnapKit

final class HourlyCollectionViewCell: BaseCollectionViewCell {
    private let timeLabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 14)
        label.textAlignment = .center
        return label
    }()
    
    private let iconImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let temperatureLabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.textAlignment = .center
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
    
    // MARK: - private functions
    func setUpText(time: String, icon: String, temp: String) {
        timeLabel.text = "\(time)시"
        let iconUrl = APIURL.icon(icon: icon)
        iconImageView.kf.setImage(with: URL(string: iconUrl.urlString))
        temperatureLabel.text = temp
    }
}

