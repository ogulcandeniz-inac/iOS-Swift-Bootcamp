//
//  WeatherManager.swift
//  Clima
//
//  Created by Oğulcan Deniz İnaç on 14.03.2024.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation
struct WeatherManager{
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=034972b3c8fff64852583d82438eb931&q=london&units=metric"
    
    func featchWeather(cityName: String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url , completionHandler: <#T##(Data?, URLResponse?, Error?) -> Void#>);
                task.resume()
            }
        }
    
    func handle(data: Data?, response: URLResponse?, error: Error?){
        if error != nil{
            print(error!)
            return
        }
        
        if let safeData = data {
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString!)
        }
    }
    
    
    
    
    
    
    }

