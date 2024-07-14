//
//  ForecastViewModel.swift
//  Weather+MVVM
//
//  Created by 양승혜 on 7/14/24.
//

import Foundation
import Alamofire

final class ForecastViewModel {
    private let networkManager = NetworkManager.shared
    
    var inputCityCellSelected: Observable<(latitude: Double, longitude: Double)?> = Observable(nil)
    
    var outputForecast: Observable<ForecastResponse?> = Observable(nil)
    
    init() { transform() }
    
    private func transform() {
        inputCityCellSelected.bind { location in
            guard let location = location else { return }
            self.fetchForecast(latitude: location.latitude, longitude: location.longitude)
        }
    }
    
    func fetchForecast(latitude: Double, longitude: Double) {
        networkManager.fetchForecastAPI(latitude: latitude, longitude: longitude) { result in
            switch result {
            case .success(let value):
                print(value)
            case .failure(let error):
                print(error)
            }
        }
    }
}
