//
//  WeatherBottomHalf.swift
//  CulminatingTask
//
//  Created by Brad Kang on 2021-03-22.
//

import SwiftUI

struct WeatherBottomHalf: View {
    
    // MARK: Stored Properties
    
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
    
    // Variable to hold sunrise time
    @State var sunriseTime: String = "5 AM"
    
    // Variable to hold the sunset time
    @State var sunsetTime: String = "6 PM"
    
    // Variable to hold the weather conditions (sunny, rainy, etc.)
    @State var conditions: String = "Sunny"
    
    // MARK: Computed Properties
    
    var body: some View {

                // First row, for conditions and chance of preciptitation
                HStack {
                    
                    Spacer()
                    
                    // Conditions
                    Text(conditions)
                        .font(.headline)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                    Spacer()
                    
                    // Chance of Precipitation
                    VStack {
                        Text("Precipitation %")
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                        
                        Text("\(precipitationChance, specifier: "%.0f")%")
                            .font(.headline)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                    }
                    Spacer()
                }
                
                // Second row, sunrise and sunset times
                HStack {
                    Spacer()
                    // Sunrise
                    VStack {
                        Text("Sunrise")
                            .font(.subheadline)
                        
                        Text(sunriseTime)
                            .font(.headline)
                            .fontWeight(.bold)
                    }
                    Spacer()
                    // Sunset
                    VStack {
                        Text("Sunset")
                            .font(.subheadline)
                        Text(sunsetTime)
                            .font(.headline)
                            .fontWeight(.bold)
                    }
                    Spacer()
                }
                // Third row, wind and preciptation amount
                HStack {
                    Spacer()
                    // Wind
                    VStack {
                        Text("Wind")
                            .font(.subheadline)
                        
                        Text("\(windSpeed, specifier: "%.1f") Km/H \(windDirection)")
                            .font(.headline)
                            .fontWeight(.bold)
                    }
                    Spacer()
                    // Precipitation amount
                    VStack {
                        Text("Precipitation")
                            .font(.subheadline)
                        
                        Text("\(precipitationAmount, specifier: "%.1f") mm")
                            .font(.headline)
                            .fontWeight(.bold)
                    }
                    Spacer()
                }
                // Fourth row, visibility and humidity
                HStack {
                    Spacer()
                    // Visibility
                    VStack {
                        Text("Visibility")
                            .font(.subheadline)
                        
                        Text("\(visibility, specifier: "%.1f") km")
                            .font(.headline)
                            .fontWeight(.bold)
                    }
                    Spacer()
                    // Humidity
                    VStack {
                        Text("Humidity")
                            .font(.subheadline)
                        
                        Text("\(humidity, specifier: "%.0f")%")
                            .font(.headline)
                            .fontWeight(.bold)
                    }
                    Spacer()
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
                    conditions = decodedWeatherData.current.condition.text
                    visibility = decodedWeatherData.current.vis_km
                    humidity = decodedWeatherData.current.humidity
                    windSpeed = decodedWeatherData.current.wind_kph
                    windDirection = decodedWeatherData.current.wind_dir
                    precipitationAmount = decodedWeatherData.current.precip_mm
                    sunriseTime = decodedWeatherData.forecast.forecastday[0].astro.sunrise
                    sunsetTime = decodedWeatherData.forecast.forecastday[0].astro.sunset
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
struct WeatherBottomHalf_Previews: PreviewProvider {
    static var previews: some View {
        WeatherBottomHalf()
    }
}
