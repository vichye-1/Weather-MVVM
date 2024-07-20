//
//  ForecastViewModel.swift
//  Weather+MVVM
//
//  Created by 양승혜 on 7/14/24.
//

import Foundation

struct DailyForecast {
    let day: String
    let icon: String
    var lowTemp: Double
    var highTemp: Double
}

final class ForecastViewModel {
    private let networkManager = NetworkManager.shared
    
    var inputViewDidLoadTrigger = Observable(())
    var inputCityIdSelected: Observable<Int?> = Observable(nil)
    
    var outputForecast: Observable<ForecastResponse?> = Observable(nil)
    
    init() { transform() }
    
    private func transform() {
        inputViewDidLoadTrigger.bind { [weak self] _ in
            self?.fetchForecast(cityId: 1835847)
        }
        
        inputCityIdSelected.bind { [weak self] cityId in
            guard let cityId = cityId else { return }
            self?.fetchForecast(cityId: cityId)
        }
    }
    
    func fetchForecast(cityId: Int) {
        networkManager.fetchForecastAPI(cityId: cityId) { result in
            print(#function)
            switch result {
            case .success(let forecast):
                self.outputForecast.value = forecast
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getDailyForecast() -> [DailyForecast] {
        guard let forecast = outputForecast.value else { return [] }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        var dailyForecasts: [String: DailyForecast] = [:]
        
        for item in forecast.list {
            guard let date = dateFormatter.date(from: item.dt_txt) else { continue }
            
            let dayFormatter = DateFormatter()
            dayFormatter.dateFormat = "yyyyMMdd"
            let dateString = dayFormatter.string(from: date)
            
            if dailyForecasts[dateString] == nil {
                let dayOfWeek = getDayOfWeek(date: date)
                dailyForecasts[dateString] = DailyForecast(day: dayOfWeek, icon: item.weather.first?.icon ?? "", lowTemp: item.main.temp_min, highTemp: item.main.temp_max)
            } else {
                if var forecast = dailyForecasts[dateString] {
                    forecast.lowTemp = min(forecast.lowTemp, item.main.temp_min)
                    forecast.highTemp = max(forecast.highTemp, item.main.temp_max)
                    dailyForecasts[dateString] = forecast
                }
            }
        }
        let sortedForecasts = dailyForecasts.sorted { $0.key < $1.key }
        return Array(sortedForecasts.map { $0.value })
    }
    
    private func getDayOfWeek(date: Date) -> String {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "E"
        dateformatter.locale = Locale(identifier: "ko_KR")
        return dateformatter.string(from: date)
    }
}
