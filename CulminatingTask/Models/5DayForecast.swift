//
//  5DayForecast.swift
//  CulminatingTask
//
//  Created by Brad Kang on 2021-03-24.
//

import Foundation

struct FiveDayForecast: Identifiable {
    
    var id = UUID()

    // Variable to hold high temp for day 1
    var highTemp1: Double = 0.0
    
    // Variable to hold high temp for day 2
    var highTemp2: Double = 0.0
    
    // Variable to hold high temp for day 3
    var highTemp3: Double = 0.0
    
    // Variable to hold high temp for day 4
    var highTemp4: Double = 0.0
    
    // Variable to hold high temp for day 5
    var highTemp5: Double = 0.0
    
    // Variable to hold the low temp for day 1
    var lowTemp1: Double = 0.0
    
    // Variable to hold the low temp for day 2
    var lowTemp2: Double = 0.0
    
    // Variable to hold the low temp for day 3
    var lowTemp3: Double = 0.0
    
    // Variable to hold the low temp for day 4
    var lowTemp4: Double = 0.0
    
    // Variable to hold the low temp for day 5
    var lowTemp5: Double = 0.0
    
    // Variable to hold the preciptation for day 1
    var precipitation1: Int = 0
    
    // Variable to hold the preciptation for day 2
    var precipitation2: Int = 0
    
    // Variable to hold the preciptation for day 3
    var precipitation3: Int = 0
    
    // Variable to hold the preciptation for day 4
    var precipitation4: Int = 0
    
    // Variable to hold the preciptation for day 5
    var precipitation5: Int = 0

    
    mutating func fetchWeather() {

        // Set the address of the JSON endpoint
        let url = URL(string: "    https://api.weatherapi.com/v1/forecast.json?key=f217946271d842a1ae2162435211503&q=Peterborough,ON&days=5&aqi=no&alerts=yes")!

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
                    highTemp1 = decodedWeatherData.forecast.forecastday[0].day.maxtemp_c
                    highTemp2 = decodedWeatherData.forecast.forecastday[1].day.maxtemp_c
                    highTemp3 = decodedWeatherData.forecast.forecastday[2].day.maxtemp_c
                    highTemp4 = decodedWeatherData.forecast.forecastday[3].day.maxtemp_c
                    highTemp5 = decodedWeatherData.forecast.forecastday[4].day.maxtemp_c
                    
                    lowTemp1 = decodedWeatherData.forecast.forecastday[0].day.mintemp_c
                    lowTemp2 = decodedWeatherData.forecast.forecastday[1].day.mintemp_c
                    lowTemp3 = decodedWeatherData.forecast.forecastday[2].day.mintemp_c
                    lowTemp4 = decodedWeatherData.forecast.forecastday[3].day.mintemp_c
                    lowTemp5 = decodedWeatherData.forecast.forecastday[4].day.mintemp_c
                    
                    precipitation1 = decodedWeatherData.forecast.forecastday[0].day.
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
