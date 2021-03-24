//
//  DailyWeather.swift
//  CulminatingTask
//
//  Created by Brad Kang on 2021-03-18.
//

import Foundation

struct DailyWeather: Decodable {
    
    var maxtemp_c: Double
    var mintemp_c: Double
    var daily_chance_of_rain: Int
    var daily_chance_of_snow: Int
}
