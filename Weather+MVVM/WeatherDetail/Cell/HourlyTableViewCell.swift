//
//  HourlyTableViewCell.swift
//  Weather+MVVM
//
//  Created by 양승혜 on 7/12/24.
//

import UIKit
import SnapKit

final class HourlyTableViewCell: BaseTableViewCell {
    private let hourlyCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    var hourlyForecasts: [HourlyForecast] = [] {
        didSet {
            hourlyCollectionView.reloadData()
        }
    }
    
    // MARK: - configure functions
    override func configureHierarchy() {
        contentView.addSubview(hourlyCollectionView)
    }
    
    override func configureLayout() {
        hourlyCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(100)
        }
    }
    
    override func configureUI() {
        configureCollectionView()
    }
    
    // MARK: - private functions
    private func configureCollectionView() {
        let identifier = HourlyCollectionViewCell.identifier
        hourlyCollectionView.delegate = self
        hourlyCollectionView.dataSource = self
        hourlyCollectionView.register(HourlyCollectionViewCell.self, forCellWithReuseIdentifier: identifier)
    }
}

extension HourlyTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hourlyForecasts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfCells: CGFloat = 5
        let spacing: CGFloat = 10
        let totalSpacing: CGFloat = (numberOfCells - 1) * spacing
        let availableWidth = collectionView.frame.width - totalSpacing
        return CGSize(width: availableWidth / 5, height: collectionView.frame.height - 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = HourlyCollectionViewCell.identifier
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! HourlyCollectionViewCell
        let hourlyResult = hourlyForecasts[indexPath.item]
        cell.setUpText(time: hourlyResult.hour, icon: hourlyResult.icon, temp: hourlyResult.temp.convertTemperature().temperatureFormat())
        return cell
    }
    
}
