//
//  ContentView.swift
//  CulminatingTask
//
//  Created by Brad Kang on 2021-03-16.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: Stored Properties
    
    // MARK: Computed Properties

    var body: some View {
        
        ScrollView {
            WeatherTopHalf()
                Rectangle()
                    .fill(Color.black)
                    .frame(width: 320, height: 1)
            WeatherBottomHalf()
            }
        }
}

    
    
    // MARK: Functions
//
//    func fetchWeather() {
//
//        // Set the address of the JSON endpoint
//        let url = URL(string: "https://api.weatherapi.com/v1/forecast.json?key=f217946271d842a1ae2162435211503&q=Peterborough,Canada&days=1&aqi=no&alerts=yes")!
//
//        // Configure a URLRequest instance
//        // Defines what type of request will be sent to the address noted above
//        var request = URLRequest(url: url)
//        request.setValue("application/json",
//                         forHTTPHeaderField: "Accept")
//        request.httpMethod = "GET"
//
//        // Run the request on a background thread and process the result.
//        // NOTE: This occurs asynchronously.
//        //       That means we don't know precisely when the request will
//        //       complete.
//        URLSession.shared.dataTask(with: request) { data, response, error in
//
//            // When the request *does* complete, there are three parameters
//            // containing data that are created:
//            //
//            // data
//            // The data returned by the server.
//            //
//            // response
//            // An object that provides response metadata, such as HTTP headers and status code. If you are making an HTTP or HTTPS request, the returned object is actually an HTTPURLResponse object.
//            //
//            // error
//            // An error object that indicates why the request failed, or nil if the request was successful.
//
//            // Verify that some data was actually returned
//            guard let weatherData = data else {
//
//                // When no data is returned, provide a descriptive error
//                //
//                // error?.localizedDescription is an example of "optional chaining"
//                // This means that if the error object is not nil, the
//                // localizedDescription property will be used
//                //
//                // ?? "Unknown error" is an example of the "nil coalescing" operator
//                // This means that when the error object *is* nil, a default string of
//                // "Unknown error" will be provided
//                print("No data in response: \(error?.localizedDescription ?? "Unknown error")")
//
//                // Don't continue past this point
//                return
//            }
//
//            // DEBUG: See what raw JSON data was returned from the server
//            //print(String(data: weatherData, encoding: .utf8)!)
//
//            // Attempt to decode the JSON into an instance of the Weather structure
//            do {
//                let decodedWeatherData = try JSONDecoder().decode(WeatherList.self, from: weatherData)
//
//                print("JSON decoded successfully")
//
//                // Now, update the UI on the main thread
//                DispatchQueue.main.async {
//
//                    // Assign the results to the following stored property
//                    conditions = decodedWeatherData.current.condition.text
//                    visibility = decodedWeatherData.current.vis_km
//                    humidity = decodedWeatherData.current.humidity
//                    windSpeed = decodedWeatherData.current.wind_kph
//                    windDirection = decodedWeatherData.current.wind_dir
//                    precipitationAmount = decodedWeatherData.current.precip_mm
//                    sunriseTime = decodedWeatherData.forecast.forecastday[0].astro.sunrise
//                    sunsetTime = decodedWeatherData.forecast.forecastday[0].astro.sunset
//                }
//            } catch {
//
//                print("Could not decode JSON into an instance of the Weather structure.")
//                print(error)
//            }
//
//        }.resume()
//        // NOTE: Invoking the resume() function
//        // on the dataTask closure is key. The request will not
//        // run, otherwise.
//
//    }
//
//    // Get the actual image data
//    func fetchImage(from address: String) {
//
//            // 1. Prepare a URLRequest to send our encoded data as JSON
//            let url = URL(string: address)!
//
//            // 2. Run the request and process the response
//            URLSession.shared.dataTask(with: url) { data, response, error in
//
//                // handle the result here – attempt to unwrap optional data provided by task
//                guard let imageData = data else {
//
//                    // Show the error message
//                    print("No data in response: \(error?.localizedDescription ?? "Unknown error")")
//
//                    return
//                }
//
//                // Update the UI on the main thread
//                DispatchQueue.main.async {
//
//                    // Attempt to create an instance of UIImage using the data from the server
//                    guard let loadedWeather = UIImage(data: imageData) else {
//
//                        // If we could not load the image from the server, show a default image
//                        conditionsImage = UIImage(named: "cloud.fill")!
//                        return
//                    }
//
//                    // Set the image loaded from the server so that it shows in the user interface
//                    conditionsImage = loadedWeather
//                }
//
//            }.resume()
//
//        }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
