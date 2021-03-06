//
//  DailyForecast.swift
//  CulminatingTask
//
//  Created by Brad Kang on 2021-03-18.
//

import Foundation

struct DailyForecast: Decodable {
    
    var date: String
    var day: DailyWeather
    var astro: SunTimes
    
}
