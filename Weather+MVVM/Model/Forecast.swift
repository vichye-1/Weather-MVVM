//
//  WeatherDetail.swift
//  Weather+MVVM
//
//  Created by 양승혜 on 7/10/24.
//

import Foundation

struct ForecastResponse: Decodable {
    let list: [ForecastList]
    let city: City
}

struct ForecastList: Decodable {
    let main: Main
    let weather: [Weather]
}

struct Main: Decodable {
    let temp: Double
    let temp_min: Double
    let temp_max: Double
}

struct Weather: Decodable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct City: Decodable {
    let id: Int
    let name: String
    let country: String
    let timezone: Int
}
