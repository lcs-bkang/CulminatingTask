//
//  ContentView.swift
//  CulminatingTask
//
//  Created by Brad Kang on 2021-03-16.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: Stored Properties
    

    
    // Initialize a timer that will fire in one second
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    // MARK: Computed Properties
    
    var body: some View {
        NavigationView {
            VStack {
                // Chooses which view to show
                if showWeather {
                    WeatherView()
                } else {
                    CalendarView()
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Spacer()
                    Image(systemName: "calendar")
                        .resizable()
                        .frame(width: 33, height: 27)
                        .foregroundColor(.red)
                        .onTapGesture {
                            self.showWeather = false
                        }
                    Spacer()
                    Image(systemName: "cloud")
                        .resizable()
                        .frame(width: 40, height: 27)
                        .foregroundColor(.blue)
                        .onTapGesture {
                            self.showWeather = true
                    }
                    Spacer()
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
