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
    @State var temperature: Double = 0.0
    
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
                    .font(.title)
                    .padding(.top, -13.0)
                
                Spacer()
                Spacer()

                // HStack for temperatures and image for the condition.
                HStack {
                    Text("Image")
                        .padding(.leading, 6.0)
                    
                    Spacer()
                    
                    Text("\(temperature)°C")
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                        
                    Spacer()
                    
                    VStack {
                        Text("\(highTemperature)°C")
                        
                        Text("\(lowTemperature)°C")
                    }
                    .padding(.trailing, 6.0)
                    
                }
                
                Rectangle()
                    .fill(Color.black)
                    .frame(width: 320, height: 1)
                Spacer()
                
                // First row, for conditions and chance of preciptitation
                HStack {
                    
                    // Conditions
                    Text(conditions)
                        .font(.headline)
                    
                    // Chance of Precipitation
                    VStack {
                        Text("Chance of Precipitation")
                            .font(.subheadline)
                            
                        
                        Text("\(precipitationChance)%")
                            .font(.headline)
                    }
                }
                // Second row, wind and preciptation amount
                HStack {
                    // Wind
                    VStack {
                        Text("Wind")
                            .font(.subheadline)
                        
                        Text(wind)
                            .font(.headline)
                    }
                    // Precipitation amount
                    VStack {
                        Text("Precipitation")
                            .font(.subheadline)
                        
                        Text("\(precipitationAmount) mm")
                            .font(.headline)
                    }
                }
                // Third row, UV Index and humidity
                HStack {
                    // UV Index
                    VStack {
                        Text("UV Index")
                            .font(.subheadline)
                        
                        Text(UVIndex)
                            .font(.headline)
                    }
                    // Humidity
                    VStack {
                        Text("Humidity")
                            .font(.subheadline)
                        
                        Text("\(humidity)%")
                            .font(.headline)
                    }
                }
            }
        }
    
    }
    
    // MARK: Functions
    
    func fetchWeather() {
        
        // Set the address of the JSON endpoint
        let url = URL(string: "https://www.metaweather.com/api/location/4118/")!

        // Configure a URLRequest instance
        // Defines what type of request will be sent to the address noted above
        var request = URLRequest(url: url)
        request.setValue("application/json",
                         forHTTPHeaderField: "Accept")
        request.httpMethod = "GET"

        // Run the request on a background thread and process the result.
        // NOTE: This occurs asynchronously.
        //       That means we don't know precisely when the request will
        //       complete.
        URLSession.shared.dataTask(with: request) { data, response, error in

            // When the request *does* complete, there are three parameters
            // containing data that are created:
            //
            // data
            // The data returned by the server.
            //
            // response
            // An object that provides response metadata, such as HTTP headers and status code. If you are making an HTTP or HTTPS request, the returned object is actually an HTTPURLResponse object.
            //
            // error
            // An error object that indicates why the request failed, or nil if the request was successful.


            // Verify that some data was actually returned
            guard let weatherData = data else {

                // When no data is returned, provide a descriptive error
                //
                // error?.localizedDescription is an example of "optional chaining"
                // This means that if the error object is not nil, the
                // localizedDescription property will be used
                //
                // ?? "Unknown error" is an example of the "nil coalescing" operator
                // This means that when the error object *is* nil, a default string of
                // "Unknown error" will be provided
                print("No data in response: \(error?.localizedDescription ?? "Unknown error")")

                // Don't continue past this point
                return

            }

            // DEBUG: See what raw JSON data was returned from the server
            //print(String(data: locationData, encoding: .utf8)!)

            // Attempt to decode the JSON into an instance of the Weather structure
            if let decodedWeatherData = try? JSONDecoder().decode(Weather.self, from: weatherData) {

                // DEBUG:
                print("Location data decoded from JSON successfully")
                print("The weather is: \(decodedWeatherData.the_temp)")

                // Now, update the UI on the main thread
                DispatchQueue.main.async {

                    // Assign the result to the "someText" stored property
                    temperature = decodedWeatherData.the_temp

                }

            } else {

                print("Could not decode JSON into an instance of the DadJoke structure.")

            }

        }.resume()
        // NOTE: Invoking the resume() function
        // on the dataTask closure is key. The request will not
        // run, otherwise.

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
