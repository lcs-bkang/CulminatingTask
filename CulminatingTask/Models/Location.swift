//
//  WeatherLocation.swift
//  CulminatingTask
//
//  Created by Brad Kang on 2021-03-17.
//

import Foundation

struct Location: Decodable, Identifiable {
    
    var id: Int
    var name: String
    var region: String
    var country: String
    
}
