//
//  ViewController.swift
//  Weather+MVVM
//
//  Created by 양승혜 on 7/10/24.
//

import UIKit
import SnapKit

class WeatherDetailViewController: BaseViewController {
    
    private let viewModel = ForecastViewModel()
    
    private let mainWeatherIdentifier = MainWeatherCell.identifier
    private let hourlyIdentifier = HourlyTableViewCell.identifier
    private let dailyIdentifier = DailyTableViewCell.identifier

    private let weatherTableView = {
        let tableview = UITableView(frame: .zero, style: .insetGrouped)
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
        bindForecast()
        viewModel.inputViewDidLoadTrigger.value = ()
//        let currentAPI = APIURL.forecast(latitude: 35.133331, longitude: 128.699997, key: APIKey.openWeatherKey)
//        NetworkManager.shared.fetchCurrentAPI(api: currentAPI) { success, fail in
//            if fail != nil {
//                print("current error!!!!!!!!")
//            } else {
//                print("current success")
//            }
//        }
//        print("@@@@@@@@@@after current@@@@@@@@@@")
//        
//        let iconAPI = APIURL.icon(icon: "01d")
//        NetworkManager.shared.fetchIconAPI(api: iconAPI) { success, fail in
//            if fail != nil {
//                print("icon Error")
//            } else {
//                print("icon success")
//            }
//        }
//        print("@@@@@@@@@@after icon@@@@@@@@@@")
    }
    
    private func bindForecast() {
        viewModel.outputForecast.bind { [weak self] _ in
            DispatchQueue.main.async {
                self?.weatherTableView.reloadData()
            }
        }
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
            make.top.horizontalEdges.equalTo(view)
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
        weatherTableView.register(MainWeatherCell.self, forCellReuseIdentifier: mainWeatherIdentifier)
        weatherTableView.register(HourlyTableViewCell.self, forCellReuseIdentifier: hourlyIdentifier)
        weatherTableView.register(DailyTableViewCell.self, forCellReuseIdentifier: dailyIdentifier)
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
        switch section {
        case 0, 1:
            return 1
        case 2:
            return 5
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: mainWeatherIdentifier, for: indexPath) as! MainWeatherCell
            if let forecast = viewModel.outputForecast.value, let currentWeather = forecast.list.first {
                let temp = currentWeather.main.temp.convertTemperature()
                let maxTemp = currentWeather.main.temp_max.convertTemperature()
                let minTemp = currentWeather.main.temp_min.convertTemperature()
                
                cell.configureUI(cityName: forecast.city.name, temperature: temp.temperatureFormat(), description: currentWeather.weather.first?.description ?? "", highTemp: maxTemp.temperatureFormat(), lowTemp: minTemp.temperatureFormat())
            }
            cell.backgroundColor = .clear
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: hourlyIdentifier, for: indexPath) as! HourlyTableViewCell
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: dailyIdentifier, for: indexPath) as! DailyTableViewCell
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0: return 200
        case 1: return 120
        case 2: return 60
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 1: return "3시간 간격의 일기예보"
        case 2: return "5일 간의 일기예보"
        default: return nil
        }
    }
}
