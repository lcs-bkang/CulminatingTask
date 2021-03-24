//
//  WeeklyForecast.swift
//  CulminatingTask
//
//  Created by Brad Kang on 2021-03-23.
//
//
import SwiftUI

struct WeeklyForecast: View {

    // MARK: Stored Properties

    // Variable to hold high temp for day 1
    @State var highTemp1: Double = 0.0
    
    // Variable to hold high temp for day 2
    @State var highTemp2: Double = 0.0
    
    // Variable to hold high temp for day 3
    @State var highTemp3: Double = 0.0
    
    // Variable to hold high temp for day 4
    @State var highTemp4: Double = 0.0
    
    // Variable to hold high temp for day 5
    @State var highTemp5: Double = 0.0
    
    // Variable to hold the low temp for day 1
    @State var lowTemp1: Double = 0.0
    
    // Variable to hold the low temp for day 2
    @State var lowTemp2: Double = 0.0
    
    // Variable to hold the low temp for day 3
    @State var lowTemp3: Double = 0.0
    
    // Variable to hold the low temp for day 4
    @State var lowTemp4: Double = 0.0
    
    // Variable to hold the low temp for day 5
    @State var lowTemp5: Double = 0.0
    
    // Variable to hold the preciptation for day 1
    @State var precipitation1: Int = 0
    
    // Variable to hold the preciptation for day 2
    @State var precipitation2: Int = 0
    
    // Variable to hold the preciptation for day 3
    @State var precipitation3: Int = 0
    
    // Variable to hold the preciptation for day 4
    @State var precipitation4: Int = 0
    
    // Variable to hold the preciptation for day 5
    @State var precipitation5: Int = 0
    
    @State var image1 = UIImage()
    @State var image2 = UIImage()
    @State var image3 = UIImage()
    @State var image4 = UIImage()
    @State var image5 = UIImage()
    


    // MARK: Computed Properties

    var body: some View {
        HStack {
            Text("Sunday")
            
            Spacer()
            
        }

    }


    // MARK: Functions

    func fetchWeather() {

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
                    
                    if decodedWeatherData.forecast.forecastday[1].day.daily_chance_of_rain == 0 {
                        precipitation2 = decodedWeatherData.forecast.forecastday[1].day.daily_chance_of_snow
                    } else {
                        precipitation2 = decodedWeatherData.forecast.forecastday[1].day.daily_chance_of_rain
                    }
                    
                    if decodedWeatherData.forecast.forecastday[2].day.daily_chance_of_rain == 0 {
                        precipitation3 = decodedWeatherData.forecast.forecastday[2].day.daily_chance_of_snow
                    } else {
                        precipitation3 = decodedWeatherData.forecast.forecastday[2].day.daily_chance_of_rain
                    }
                    if decodedWeatherData.forecast.forecastday[3].day.daily_chance_of_rain == 0 {
                        precipitation4 = decodedWeatherData.forecast.forecastday[3].day.daily_chance_of_snow
                    } else {
                        precipitation4 = decodedWeatherData.forecast.forecastday[3].day.daily_chance_of_rain
                    }
                    if decodedWeatherData.forecast.forecastday[4].day.daily_chance_of_rain == 0 {
                        precipitation5 = decodedWeatherData.forecast.forecastday[4].day.daily_chance_of_snow
                    } else {
                        precipitation5 = decodedWeatherData.forecast.forecastday[4].day.daily_chance_of_rain
                    }
                    if decodedWeatherData.forecast.forecastday[0].day.daily_chance_of_rain == 0 {
                        precipitation1 = decodedWeatherData.forecast.forecastday[0].day.daily_chance_of_snow
                    } else {
                        precipitation1 = decodedWeatherData.forecast.forecastday[0].day.daily_chance_of_rain
                    }
                    fetchImage1(from: "https:\(decodedWeatherData.forecast.forecastday[0].day.)")
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
    func fetchImage1(from address: String) {
        
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
                    image1 = UIImage(named: "cloud.fill")!
                    return
                }
                
                // Set the image loaded from the server so that it shows in the user interface
                image1 = loadedWeather
            }
            
        }.resume()
        
        
    }
}

struct WeeklyForecast_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyForecast()
    }
}
