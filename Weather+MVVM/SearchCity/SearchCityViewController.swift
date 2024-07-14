//
//  SearchCityViewController.swift
//  Weather+MVVM
//
//  Created by 양승혜 on 7/14/24.
//

import UIKit

final class SearchCityViewController: BaseViewController {
    private let citySearchBar = {
        let citysearchBar = UISearchBar()
        citysearchBar.placeholder = "Search for a city"
        return citysearchBar
    }()
    
    override func configureHierarchy() {
        [citySearchBar].forEach {
            view.addSubview($0)
        }
    }
    
    override func configureLayout() {
        citySearchBar.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
