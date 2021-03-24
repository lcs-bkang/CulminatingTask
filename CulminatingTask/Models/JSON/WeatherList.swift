//
//  WeatherList.swift
//  CulminatingTask
//
//  Created by Brad Kang on 2021-03-18.
//

import Foundation

struct WeatherList: Decodable {
    
    var location: Location 
    var current: currentForecast
    var forecast: ForecastDay
}
