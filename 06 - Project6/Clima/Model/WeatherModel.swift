//
//  WeatherModel.swift
//  Clima
//
//  Created by Oğulcan Deniz İnaç on 19.03.2024.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    let conditionId: Int
    let citynmae: String
    let temperature: Double
    
    var temperatyre: String{
        return String(format: "%.1f", temperature)
    }
    
    var conditionName: String{
        switch conditionId {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 700...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 800...884:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
}
