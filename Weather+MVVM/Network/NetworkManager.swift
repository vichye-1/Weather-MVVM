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
    
    typealias forecastCompletionHandler = (String, AFError?) -> Void
    typealias currentCompletionHandler = (String, AFError?) -> Void
    
    func fetchForecastAPI(api: APIURL, completionHandler: @escaping forecastCompletionHandler) {
        print(#function)
        guard let url = URL(string: api.urlString) else {
            print("url nil")
            return
        }
        AF.request(url).validate(statusCode: 200..<500).responseString { response in
            switch response.result {
            case .success(let value):
                print(value)
                print("==================")
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
                print(value)
                print("++++++++current+++++++")
            case .failure(let error):
                print(error)
            }
        }
    }
}
