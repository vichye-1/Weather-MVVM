//
//  LoadCity.swift
//  Weather+MVVM
//
//  Created by 양승혜 on 7/15/24.
//

import Foundation

struct CityInfo: Codable {
    let id: Int
    let name: String
    let state : String?
    let country: String
    let coord: Coordinate
}

struct Coordinate: Codable {
    let lon: Double
    let lat: Double
}

class CityLoader {
    static func loadCities() -> [CityInfo] {
        let fileName: String = "CityList"
        let extensionType = "json"
        
        guard let fileLocation = Bundle.main.url(forResource: fileName, withExtension: extensionType), let data = try? Data(contentsOf: fileLocation) else {
            print("fail to load cityList")
            return []
        }
        
        do {
            let cities = try JSONDecoder().decode([CityInfo].self, from: data)
            return cities
        } catch {
            print("error decoding")
            return []
        }
    }
}
