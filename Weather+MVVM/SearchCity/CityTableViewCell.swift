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
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    override func configureHierarchy() {
        [hashtagLabel, cityLabel].forEach {
            contentView.addSubview($0)
        }
    }
    
    override func configureLayout() {
        hashtagLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview().multipliedBy(0.8)
        }
        cityLabel.snp.makeConstraints { make in
            make.leading.equalTo(hashtagLabel.snp.trailing).offset(8)
            make.top.equalTo(hashtagLabel.snp.top)
        }
    }
}
