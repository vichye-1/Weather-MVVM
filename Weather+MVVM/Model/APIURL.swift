//
//  APIURL.swift
//  Weather+MVVM
//
//  Created by 양승혜 on 7/12/24.
//

import Foundation

enum APIURL {
    case forecast(cityId: Int)
    case icon(icon: String)
    
    var urlString: String {
        switch self {
        case .forecast(let cityId):
            return "https://api.openweathermap.org/data/2.5/forecast?id=\(cityId)&appid=\(APIKey.openWeatherKey)"
        case .icon(let icon):
            return "https://openweathermap.org/img/wn/\(icon).png"
        }
    }
}
