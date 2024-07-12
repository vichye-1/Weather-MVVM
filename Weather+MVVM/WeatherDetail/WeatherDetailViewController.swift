//
//  ViewController.swift
//  Weather+MVVM
//
//  Created by 양승혜 on 7/10/24.
//

import UIKit
import SnapKit

class WeatherDetailViewController: BaseViewController {
    
//    private var cityWeatherScrollView = {
//        let view = UIScrollView()
//        view.backgroundColor = .systemYellow
//        view.maximumZoomScale = 4
//        view.minimumZoomScale = 1
//        view.showsVerticalScrollIndicator = false
//        view.showsHorizontalScrollIndicator = false
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()

    private let weatherDetailTableView = {
        let tableview = UITableView()
        tableview.backgroundColor = .gray
        return tableview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func configureHierarchy() {
        view.addSubview(weatherDetailTableView)
    }
    
    override func configureLayout() {
        weatherDetailTableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    override func configureTableView() {
        weatherDetailTableView.delegate = self
        weatherDetailTableView.dataSource = self
        weatherDetailTableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
    }
}

extension WeatherDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        return cell
    }
}

//extension WeatherDetailViewController: UIScrollViewDelegate {
//    
//}
