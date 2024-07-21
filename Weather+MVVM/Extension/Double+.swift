//
//  Double+.swift
//  Weather+MVVM
//
//  Created by 양승혜 on 7/16/24.
//

import Foundation

extension Double {
    func convertTemperature() -> Double {
        return self - 273.15
    }
    
    func temperatureFormat() -> String {
        return String(format: "%.0f°", self)
    }
}
