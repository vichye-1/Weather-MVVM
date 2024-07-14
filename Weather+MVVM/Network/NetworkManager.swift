//
//  NetworkManager.swift
//  Weather+MVVM
//
//  Created by 양승혜 on 7/10/24.
//

import Foundation
import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    private init() { }
    
    typealias forecastCompletionHandler = (Result<ForecastResponse, Error>) -> Void
    typealias currentCompletionHandler = (String, AFError?) -> Void
    typealias iconCompletionHandler = (String, AFError?) -> Void
    
    func fetchForecastAPI(latitude: Double, longitude: Double, completionHandler: @escaping forecastCompletionHandler) {
        print(#function)
        let api = APIURL.forecast(latitude: latitude, longitude: longitude, key: APIKey.openWeatherKey)
        guard let url = URL(string: api.urlString) else {
            print("url nil")
            return
        }
//        let decoder = JSONDecoder()
//        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        AF.request(url).responseDecodable(of: ForecastResponse.self) { response in
            switch response.result {
            case .success(let value):
                completionHandler(.success(value))
                print(value)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchCurrentAPI(api: APIURL, completionHandler: @escaping currentCompletionHandler) {
        print(#function)
        guard let url = URL(string: api.urlString) else {
            print("current url nil")
            return
        }
        AF.request(url).validate(statusCode: 200..<500).responseString { response in
            switch response.result {
            case .success(let value):
                //print(value)
                print("++++++++current+++++++")
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchIconAPI(api: APIURL, completionHandler: @escaping iconCompletionHandler) {
        print(#function)
        guard let url = URL(string: api.urlString) else {
            print("icon url nil")
            return
        }
        AF.request(url).validate(statusCode: 200..<500).responseString { response in
            switch response.result {
            case .success(let value):
                //print(value)
                print("#############icon###########")
            case .failure(let error):
                print(error)
            }
        }
    }
}
