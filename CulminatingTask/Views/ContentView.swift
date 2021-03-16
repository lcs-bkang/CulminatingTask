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
    @State var temperature: String
    
    // Variable to hold the weather (sunny, rainy, etc.)
    @State var conditions: String
    
    // Variable to hold the high temperature of the day
    @State var highTemperature: String
    
    // Variable to hold the low temperature of the day
    @State var lowTemperature: String
    
    // Variable to hold the UV Index value
    @State var UVIndex: Int
    
    // Variable to hold the wind speed and direction
    @State var wind: String
    
    // Variable to hold precipitation chance
    @State var precipitationChance: String
    
    // Variable to hold the precipitation amount in mm
    @State var precipitationAmount: String
    
    // Variable to hold the humidity
    @State var humidity: String
    
    // MARK: Computed Properties
    
    var body: some View {
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
