//
//  NetworkService.swift
//  Viper Example 01
//
//  Created by Ash on 10.02.2022.
//

import Foundation

class NetworkService {
    
    
    var endpoint = URLComponents(string: "https://api.nomics.com/v1/currencies/ticker")!

    
    func fetchData(callback: @escaping ([Currency]) -> Void) {
        
        let queryItems = [
            URLQueryItem(name: "key", value: "10bb12333c252e9019ed072ae805ed48a94d9df8"),
            URLQueryItem(name: "ids", value: "BTC,ETH,XRP"),
            URLQueryItem(name: "interval", value: "30d"),
            URLQueryItem(name: "convert", value: "USD"),
    //        URLQueryItem(name: "platform-currency", value: "ETH"),
    //        URLQueryItem(name: "page", value: "1"),
        ]
        endpoint.queryItems = queryItems
        let url = endpoint.url!
        print(url)
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            if let data = data {
                let jsonData = try? JSONDecoder().decode([Currency].self, from: data)
                callback(jsonData ?? [])
            }
        }
        task.resume()
    }
    
    func loadImage(urlString: String, callback: @escaping (_ data: Data) -> Void) {
        
        let checkUrl = URL(string: urlString)
        
        guard let url = checkUrl else {
            print("Wrong url")
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            if let data = data {
                callback(data)
            }
        }
        task.resume()
    }
    
    
    
}
