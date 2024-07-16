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
    
    var inputViewDidLoadTrigger = Observable(())
    var inputCityIdSelected: Observable<Int?> = Observable(nil)
    
    var outputForecast: Observable<ForecastResponse?> = Observable(nil)
    
    init() { transform() }
    
    private func transform() {
        inputViewDidLoadTrigger.bind { _ in
            self.fetchForecast(cityId: 1835847)
        }
        
        inputCityIdSelected.bind { cityId in
            guard let cityId = cityId else { return }
            self.fetchForecast(cityId: cityId)
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
}
