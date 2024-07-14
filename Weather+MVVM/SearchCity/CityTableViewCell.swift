//
//  CityTableViewCell.swift
//  Weather+MVVM
//
//  Created by 양승혜 on 7/15/24.
//

import UIKit
import SnapKit

class CityTableViewCell: BaseTableViewCell {
    private let hashtagLabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 17)
        label.text = "#"
        return label
    }()
    
    private let cityLabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Seoul"
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .left
        return label
    }()
    
    private let countryLabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 14)
        label.text = "KR"
        label.textAlignment = .left
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    override func configureHierarchy() {
        [hashtagLabel, cityLabel, countryLabel].forEach {
            contentView.addSubview($0)
        }
    }
    
    override func configureLayout() {
        hashtagLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview().multipliedBy(0.7)
        }
        cityLabel.snp.makeConstraints { make in
            make.leading.equalTo(hashtagLabel.snp.trailing).offset(8)
            make.top.equalTo(hashtagLabel.snp.top)
        }
        countryLabel.snp.makeConstraints { make in
            make.leading.equalTo(cityLabel.snp.leading)
            make.top.equalTo(cityLabel.snp.bottom).offset(4)
            make.height.equalTo(20)
        }
    }
}
