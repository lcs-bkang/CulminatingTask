//
//  AppView.swift
//  CulminatingTask
//
//  Created by Brad Kang on 2021-03-24.
//

import SwiftUI

struct AppView: View {
    
    // Variable to hold what view to choose
    @State var showWeather: Bool = false
    
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

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
