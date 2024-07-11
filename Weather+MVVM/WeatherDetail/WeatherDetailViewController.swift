//
//  ViewController.swift
//  Weather+MVVM
//
//  Created by 양승혜 on 7/10/24.
//

import UIKit
import SnapKit

class WeatherDetailViewController: BaseViewController {

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

}

