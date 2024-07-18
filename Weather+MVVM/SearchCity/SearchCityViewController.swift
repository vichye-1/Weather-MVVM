//
//  SearchCityViewController.swift
//  Weather+MVVM
//
//  Created by 양승혜 on 7/14/24.
//

import UIKit

final class SearchCityViewController: BaseViewController {
        
    private var cities: [CityInfo] = []
    private var filteredCities: [CityInfo] = []
    
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
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        cityTableView.rowHeight = 60
        loadCities()
        configureTableView()
    }
    
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
    private func configureTableView() {
        let identifier = CityTableViewCell.identifier
        cityTableView.delegate = self
        cityTableView.dataSource = self
        cityTableView.register(CityTableViewCell.self, forCellReuseIdentifier: identifier)
    }
    
    // MARK: - custom funcs
    private func loadCities() {
        cities = CityLoader.loadCities()
        filteredCities = cities
        cityTableView.reloadData()
    }
}

extension SearchCityViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredCities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = CityTableViewCell.identifier
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! CityTableViewCell
        let city = filteredCities[indexPath.row]
        cell.configureLabels(city: city)
        return cell
    }
}
