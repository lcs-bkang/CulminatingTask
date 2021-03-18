//
//  CurrentForecast.swift
//  CulminatingTask
//
//  Created by Brad Kang on 2021-03-18.
//

import Foundation

struct currentForecast: Decodable {

    var temp_c: Double
    var wind_kph: Double
    var wind_dir: String
    var precip_mm: Double
    var humidity: Int
    var vis_km: Double
    var uv: Double
    var condition: Condition
}
