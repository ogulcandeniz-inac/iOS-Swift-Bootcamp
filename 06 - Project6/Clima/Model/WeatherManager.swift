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
        self.performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) {(data, response, error) in
                if error != nil{
                    print(error!)
                    return
                }
                if let safeData = data{
                    paresJSON(weatherData: safeData)
                }
            }
            task.resume()
        }
    }
    
    func paresJSON(weatherData: Data){
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, citynmae: name, temperature: temp)
            
            print(weather)
            print(weather.conditionName)
             
        }
        catch{
            print(error)
        }
    }
}
