//
//  ContentView.swift
//  CulminatingTask
//
//  Created by Brad Kang on 2021-03-16.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: Stored Properties
    
    // Variable to hold the temperature
    var temperature: String
    
    // Variable to hold the weather (sunny, rainy, etc.)
    var conditions: String
    
    // Variable to hold the high temperature of the day
    var highTemperature: String
    
    // Variable to hold the low temperature of the day
    var lowTemperature: String
    
    // Variable to hold the UV Index value
    var UVIndex: Int
    
    // Variable to hold the wind speed and direction
    var wind: String
    
    // Variable to hold precipitation chance
    var precipitationChance: String
    
    // Variable to hold the precipitation amount in mm
    var precipitationAmount: String
    
    // Variable to hold the humidity
    var humidity: String
    
    // MARK: Computed Properties
    
    var body: some View {
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
