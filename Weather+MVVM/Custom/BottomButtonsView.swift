//
//  BottomButtonsView.swift
//  Weather+MVVM
//
//  Created by 양승혜 on 7/14/24.
//

import UIKit
import SnapKit

final class BottomButtonsView: UIView {
    let mapButton = {
        let button = UIButton()
        let imageConfiguration = UIImage.SymbolConfiguration(pointSize: 20, weight: .light)
        let image = UIImage(systemName: "map", withConfiguration: imageConfiguration)
        button.setImage(image, for: .normal)
        button.tintColor = .white
        return button
    }()
    let listButton = {
        let button = UIButton()
        let imageConfiguration = UIImage.SymbolConfiguration(pointSize: 20, weight: .light)
        let image = UIImage(systemName: "list.bullet", withConfiguration: imageConfiguration)
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    private func configureUI() {
        [mapButton, listButton].forEach { addSubview($0) }
        
        let isSmallDevice: Bool = {
            if UIDevice.current.userInterfaceIdiom == .phone {
                let screenHeight = UIScreen.main.bounds.height
                return screenHeight < 800
            }
            return false
        }()
        
        mapButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            if isSmallDevice {
                make.centerY.equalToSuperview()
            } else {
                make.centerY.equalToSuperview().multipliedBy(0.7)
            }
            make.width.height.equalTo(44)
        }
        listButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(16)
            if isSmallDevice {
                make.centerY.equalToSuperview()
            } else {
                make.centerY.equalToSuperview().multipliedBy(0.7)
            }
            make.width.height.equalTo(44)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
