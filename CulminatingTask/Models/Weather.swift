//
//  WeatherLocation.swift
//  CulminatingTask
//
//  Created by Brad Kang on 2021-03-17.
//

import Foundation

struct Weather: Decodable, Identifiable {
    
    var id: Int
    var weather_state_name: String
    var weather_state_abbr: String
    var wind_direction_compass: String
    var min_temp: Double
    var max_temp: Double
    var the_temp: Double
    var wind_speed: Double
    var humidity: Int
    
}
