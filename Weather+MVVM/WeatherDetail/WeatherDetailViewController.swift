//
//  ViewController.swift
//  Weather+MVVM
//
//  Created by 양승혜 on 7/10/24.
//

import UIKit
import SnapKit

class WeatherDetailViewController: BaseViewController {

    private let weatherTableView = {
        let tableview = UITableView(frame: .zero, style: .insetGrouped)
        tableview.backgroundColor = .gray
        return tableview
    }()
    
    private let bottomButtonsView: BottomButtonsView = {
        let view = BottomButtonsView()
        view.backgroundColor = .darkGray
        return view
    }()
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        bottomButtonActions()
        
        let latitude = 35.133331
        let longitude = 128.699997
        
        NetworkManager.shared.fetchForecastAPI(latitude: latitude, longitude: longitude) { result in
            switch result {
            case .success(let value):
                print("Forecast Success!!!!!!!")
                print(value)
            case .failure(let error):
                print(error)
            }
        }
        
        print("@@@@@@@@@@after forecast@@@@@@@@@@")
        
        let currentAPI = APIURL.forecast(latitude: 35.133331, longitude: 128.699997, key: APIKey.openWeatherKey)
        NetworkManager.shared.fetchCurrentAPI(api: currentAPI) { success, fail in
            if let fail = fail {
                print("current error!!!!!!!!")
            } else {
                print("current success")
            }
        }
        print("@@@@@@@@@@after current@@@@@@@@@@")
        
        let iconAPI = APIURL.icon(icon: "01d")
        NetworkManager.shared.fetchIconAPI(api: iconAPI) { success, fail in
            if let fail = fail {
                print("icon Error")
            } else {
                print("icon success")
            }
        }
        print("@@@@@@@@@@after icon@@@@@@@@@@")
    }

    // MARK: - configure funcs
    override func configureHierarchy() {
        [weatherTableView, bottomButtonsView].forEach {
            view.addSubview($0)
        }
    }
    
    override func configureLayout() {
        let long = 79
        let short = 49
        
        weatherTableView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(bottomButtonsView.snp.top)
        }
        bottomButtonsView.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalTo(view)
            make.height.equalTo(view.safeAreaLayoutGuide.layoutFrame.size.height > 800 ? long : short)
        }
    }
    
    override func configureTableView() {
        weatherTableView.delegate = self
        weatherTableView.dataSource = self
        weatherTableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
    }
    
    // MARK: - private funcs
    private func bottomButtonActions() {
        bottomButtonsView.mapButton.addTarget(self, action: #selector(mapButtonTapped), for: .touchUpInside)
        bottomButtonsView.listButton.addTarget(self, action: #selector(listButtonTapped), for: .touchUpInside)
    }
    @objc private func mapButtonTapped() {
        let cityMapVC = CityMapViewController()
        self.present(cityMapVC, animated: true)
    }
    @objc private func listButtonTapped() {
        let searchCityVC = SearchCityViewController()
        self.navigationController?.pushViewController(searchCityVC, animated: true)
    }
}

// MARK: - UITableView
extension WeatherDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        return cell
    }
}
