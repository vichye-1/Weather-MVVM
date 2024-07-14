//
//  SearchCityViewController.swift
//  Weather+MVVM
//
//  Created by 양승혜 on 7/14/24.
//

import UIKit

final class SearchCityViewController: BaseViewController {
    
    let identifier = CityTableViewCell.identifier
    
    private let citySearchBar = {
        let citysearchBar = UISearchBar()
        citysearchBar.placeholder = "Search for a city"
        return citysearchBar
    }()
    
    private let cityTableView = {
        let tv = UITableView()
        tv.backgroundColor = .white
        return tv
    }()
    
    // MARK: - configureUI
    override func configureHierarchy() {
        [citySearchBar, cityTableView].forEach {
            view.addSubview($0)
        }
    }
    
    override func configureLayout() {
        citySearchBar.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
        }
        cityTableView.snp.makeConstraints { make in
            make.top.equalTo(citySearchBar.snp.bottom)
            make.horizontalEdges.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    override func configureTableView() {
        cityTableView.delegate = self
        cityTableView.dataSource = self
        cityTableView.register(CityTableViewCell.self, forCellReuseIdentifier: identifier)
    }
    
    // MARK: - custom funcs
    
}

extension SearchCityViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! CityTableViewCell
        return cell
    }
}
