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
    @State var temperature: String = "Temperature"
    
    // Variable to hold the weather (sunny, rainy, etc.)
    @State var conditions: String = "Conditions"
    
    // Variable to hold the high temperature of the day
    @State var highTemperature: String = "High"
    
    // Variable to hold the low temperature of the day
    @State var lowTemperature: String = "Low"
    
    // Variable to hold the UV Index value
    @State var UVIndex: String = "UV Index"
    
    // Variable to hold the wind speed and direction
    @State var wind: String = "Wind"
    
    // Variable to hold precipitation chance
    @State var precipitationChance: String = "Precipitation Chance"
    
    // Variable to hold the precipitation amount in mm
    @State var precipitationAmount: String = "Amount of Precipitation"
    
    // Variable to hold the humidity
    @State var humidity: String = "Humidity"
    
    // Variable for the location
    @State var location: String = "Location"
    
    // MARK: Computed Properties
    
    var body: some View {
        
        ScrollView {
            VStack {
                Text(location)
                
                // HStack for temperatures and image for the condition.
                HStack {
                    Text("Image")
                    Spacer()
                    Text("\(temperature)°C")
                        .multilineTextAlignment(.center)
                        
                    Spacer()
                    VStack {
                        Text("\(highTemperature)°C")
                        
                        Text("\(lowTemperature)°C")
                    }
                }
                // First row, for conditions and chance of preciptitation
                HStack {
                    
                    // Conditions
                    Text(conditions)
                    
                    // Chance of Precipitation
                    VStack {
                        Text("Chance of Precipitation")
                        
                        Text("\(precipitationChance)%")
                    }
                }
                // Second row, wind and preciptation amount
                HStack {
                    // Wind
                    VStack {
                        Text("Wind")
                        
                        Text(wind)
                    }
                    // Precipitation amount
                    VStack {
                        Text("Precipitation")
                        
                        Text("\(precipitationAmount) mm")
                    }
                }
                // Third row, UV Index and humidity
                HStack {
                    // UV Index
                    VStack {
                        Text("UV Index")
                        
                        Text(UVIndex)
                    }
                    // Humidity
                    VStack {
                        Text("Humidity")
                        
                        Text("\(humidity)%")
                    }
                }
            }
        }
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}