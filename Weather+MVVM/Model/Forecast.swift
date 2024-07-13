//
//  WeatherDetail.swift
//  Weather+MVVM
//
//  Created by 양승혜 on 7/10/24.
//

import Foundation

struct ForecastResponse: Decodable {
    let name: String
}

struct DetailWeather: Decodable {
    let temp: Double
    let feelsLike: Double
    let tempMin: Double
    let tempMax: Double
    let humidity: Int
}
