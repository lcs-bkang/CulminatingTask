//
//  ContentView.swift
//  CulminatingTask
//
//  Created by Brad Kang on 2021-03-16.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: Stored Properties
    
    // Variable to hold what view to choose
    @State var showWeather: Bool = false
    
    // MARK: Computed Properties
    
    var body: some View {
        NavigationView {
            VStack {
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
                    Image(systemName: "cloud")
                        .onTapGesture {
                            self.showWeather = true
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
