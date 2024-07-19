//
//  NetworkManager.swift
//  Weather+MVVM
//
//  Created by 양승혜 on 7/10/24.
//

import Foundation
import Alamofire

final class NetworkManager {
    static let shared = NetworkManager()
    private init() { }
    
    typealias forecastCompletionHandler = (Result<ForecastResponse, Error>) -> Void
    typealias currentCompletionHandler = (String, AFError?) -> Void
    typealias iconCompletionHandler = (String, AFError?) -> Void
    
    func fetchForecastAPI(cityId: Int, completionHandler: @escaping forecastCompletionHandler) {
        print(#function)
        let api = APIURL.forecast(cityId: cityId)
        guard let url = URL(string: api.urlString) else {
            print("url nil")
            return
        }
        //MARK: [Issue] - decoder를 .convertFromSnakeCase로 변환만 하고, 실제로 쓰지 않았다.
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
