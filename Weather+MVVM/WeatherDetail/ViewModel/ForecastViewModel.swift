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
    
    var inputCityIdSelected: Observable<Int?> = Observable(nil)
    var outputForecast: Observable<ForecastResponse?> = Observable(nil)
    
    init() { transform() }
    
    private func transform() {
        inputCityIdSelected.bind { cityId in
            guard let cityId = cityId else { return }
            self.fetchForecast(cityId: cityId)
        }
    }
    
    func fetchForecast(cityId: Int) {
        networkManager.fetchForecastAPI(cityId: cityId) { result in
            switch result {
            case .success(let value):
                print(value)
            case .failure(let error):
                print(error)
            }
        }
    }
}
