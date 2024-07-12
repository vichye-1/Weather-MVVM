//
//  APIURL.swift
//  Weather+MVVM
//
//  Created by 양승혜 on 7/12/24.
//

import Foundation

enum APIURL {
    case forecast(latitude: Double, longitude: Double, key: String)
    case current(latitude: Double, longitude: Double, key: String)
    case icon(icon: String)
    
    var urlString: String {
        switch self {
        case .forecast(let latitude, let longitude, let key):
            return "https://api.openweathermap.org/data/2.5/forecast?lat=\(latitude)&lon=\(longitude)&appid=\(key)"
        case .current(latitude: let latitude, longitude: let longitude, key: let key):
            return "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(key)"
        case .icon(let icon):
            return "https://openweathermap.org/img/wn/\(icon).png"
        }
    }
}
