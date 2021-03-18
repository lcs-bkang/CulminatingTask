//
//  CurrentForecast.swift
//  CulminatingTask
//
//  Created by Brad Kang on 2021-03-18.
//

import Foundation

struct CurrentForecast: Decodable, Identifiable {
    
    var id: Int
    var temp_c: Double
    var wind_kph: Double
    var wind_dir: Double
    var precip_mm: Double
    var humidity: Int
    var visib_km: Double
    var uv: Double
}
