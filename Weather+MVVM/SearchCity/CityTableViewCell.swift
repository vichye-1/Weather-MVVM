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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    override func configureHierarchy() {
        [hashtagLabel].forEach {
            contentView.addSubview($0)
        }
    }
    
    override func configureLayout() {
        hashtagLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
        }
    }
}
