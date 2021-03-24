//
//  WeatherTopHalf.swift
//  CulminatingTask
//
//  Created by Brad Kang on 2021-03-22.
//

import SwiftUI

struct WeatherTopHalf: View {
    
    // MARK: Stored Properties
    
    // Variable for the location
    @State var location: String = "Location"
    
    // Variable to hold feels like...
    @State var feelsLike: Double = 0.0
    
    // Variable to hold conditions image
    @State var conditionsImage: UIImage = UIImage()
    
    // Variable to hold the temperature
    @State var temperature: Double = 0.0
    
    // Variable to hold the high
    @State var highTemperature: Double = 0.0
    
    // Variable to hold the low
    @State var lowTemperature: Double = 0.0
    
    // MARK: Computed Properties
    
    var body: some View {
            VStack {
                Text(location)
                    .font(.title)
                    .padding(.top, 20.0)
                
                Spacer()
                
                // HStack for temperatures and image for the condition.
                HStack(spacing: 15) {
                    Image(uiImage: conditionsImage)
                        .padding(.leading, 15.0)
                        .foregroundColor(.yellow)
                        .scaledToFit()
                    Spacer()
                    
                    Text("\(temperature, specifier: "%.0f")°")
                        .font(.system(size: 55))
                        .multilineTextAlignment(.center)
                    Spacer()
                    VStack {
                        
                        Text("High: \(highTemperature, specifier: "%.0f")°")
                            .font(.caption)
                        Text("Low: \(lowTemperature, specifier: "%.0f")°")
                            .font(.caption)
                        
                    }
                    .padding(.trailing, 15.0)
                    .font(.subheadline)
                }
                
                Text("Feels Like: \(feelsLike, specifier: "%.0f")°")
                    .font(.caption)
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
                
                fetchImage(from: "https:\(decodedWeatherData.current.condition.icon)")
                
                // Now, update the UI on the main thread
                DispatchQueue.main.async {
                    
                    // Assign the results to the following stored property
                    temperature = decodedWeatherData.current.temp_c
                    feelsLike = decodedWeatherData.current.feelslike_c
                    location = decodedWeatherData.location.name
                    highTemperature = decodedWeatherData.forecast.forecastday[0].day.maxtemp_c
                    lowTemperature = decodedWeatherData.forecast.forecastday[0].day.mintemp_c
                    
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
    
    // Get the actual image data
    func fetchImage(from address: String) {
        
        // 1. Prepare a URLRequest to send our encoded data as JSON
        let url = URL(string: address)!
        
        // 2. Run the request and process the response
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            // handle the result here – attempt to unwrap optional data provided by task
            guard let imageData = data else {
                
                // Show the error message
                print("No data in response: \(error?.localizedDescription ?? "Unknown error")")
                
                return
            }
            
            // Update the UI on the main thread
            DispatchQueue.main.async {
                
                // Attempt to create an instance of UIImage using the data from the server
                guard let loadedWeather = UIImage(data: imageData) else {
                    
                    // If we could not load the image from the server, show a default image
                    conditionsImage = UIImage(named: "cloud.fill")!
                    return
                }
                
                // Set the image loaded from the server so that it shows in the user interface
                conditionsImage = loadedWeather
            }
            
        }.resume()
        
        
    }
}

struct WeatherTopHalf_Previews: PreviewProvider {
    static var previews: some View {
        WeatherTopHalf()
    }
}
