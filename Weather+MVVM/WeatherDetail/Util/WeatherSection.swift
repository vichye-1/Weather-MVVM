//
//  WeatherSection.swift
//  Weather+MVVM
//
//  Created by 양승혜 on 8/3/24.
//

import Foundation

enum Section: CaseIterable {
    case mainWeather
    case hourlyWeather
    case dailyWeather
    
    var cellIdentifier: String {
        switch self {
        case .mainWeather:
            return MainWeatherCell.identifier
        case .hourlyWeather:
            return HourlyTableViewCell.identifier
        case .dailyWeather:
            return DailyTableViewCell.identifier
        }
    }
    
    var numberOfRows: Int {
        switch self {
        case .mainWeather, .hourlyWeather:
            return 1
        case .dailyWeather:
            return ForecastViewModel().getDailyForecast().count
        }
    }
    
    var rowHeight: CGFloat {
        switch self {
        case .mainWeather:
            return 200
        case .hourlyWeather:
            return 120
        case .dailyWeather:
            return 50
        }
    }
    
    var headerTitle: String? {
        switch self {
        case .mainWeather:
            return "3시간 간격의 일기예보"
        case .hourlyWeather:
            return "5일 간의 일기예보"
        case .dailyWeather:
            return nil
        }
    }
}
