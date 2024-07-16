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
    
    // MARK: - configure funcs
    override func configureHierarchy() {
        [dayLabel].forEach { contentView.addSubview($0) }
    }
    
    override func configureLayout() {
        dayLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(contentView.safeAreaLayoutGuide).offset(16)
            make.height.equalTo(30)
            make.width.equalTo(40)
        }
    }
}
