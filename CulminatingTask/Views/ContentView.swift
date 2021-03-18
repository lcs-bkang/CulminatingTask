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
    
    // Variable to hold feels like...
    @State var feelsLike: Double = 0.0
    
    // Variable to hold the wind speed
    @State var windSpeed: Double = 0.0
    
    // Variable to hold the wind direction
    @State var windDirection: String = "Wind Direction"
    
    // Variable to hold the precipitation chance
    @State var precipitationChance: Double = 0.0
    
    // Variable to hold the precipitation amount
    @State var precipitationAmount: Double = 0.0
    
    // Variable to hold the humidity
    @State var humidity: Int = 0
    
    // Variable to hold visibility
    @State var visibility: Double = 0.0
    
    // Variable for the location
    @State var location: String = "Location"
    
    // MARK: Computed Properties
    
    var body: some View {
        
        ScrollView {
            VStack {
                Text(location)
                    .font(.title)
                    .padding(.top, -8.0)
                
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
                    
                        Text("\(feelsLike)°C")
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
                        
                        Text("\(windSpeed) \(windDirection)")
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
                // Third row, visibility and humidity
                HStack {
                    // Visibility
                    VStack {
                        Text("Visibility")
                            .font(.subheadline)
                        
                        Text("\(visibility) km")
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
        .onAppear() {
        fetchWeather()
        }
    }

    
    // MARK: Functions
    
    func fetchWeather() {
        
        // Set the address of the JSON endpoint
        let url = URL(string: "https://api.weatherapi.com/v1/forecast.json?key=f217946271d842a1ae2162435211503&q=Peterborough,Canada&days=1&aqi=no&alerts=yes")!

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
            //print(String(data: weatherData, encoding: .utf8)!)

            // Attempt to decode the JSON into an instance of the Weather structure
            do {
                let decodedWeatherData = try JSONDecoder().decode(WeatherList.self, from: weatherData)
                
                print("JSON decoded successfully")

                    // Now, update the UI on the main thread
                    DispatchQueue.main.async {

                        // Assign the results to the following stored property
                        temperature = decodedWeatherData.current.temp_c
                        conditions = decodedWeatherData.current.condition.text
                        feelsLike = decodedWeatherData.current.feelslike_c
                        visibility = decodedWeatherData.current.vis_km
                        humidity = decodedWeatherData.current.humidity
                        windSpeed = decodedWeatherData.current.wind_kph
                        windDirection = decodedWeatherData.current.wind_dir
                        precipitationAmount = decodedWeatherData.current.precip_mm
                    }
            } catch {

                print("Could not decode JSON into an instance of the Weather structure.")
                print(error)
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
