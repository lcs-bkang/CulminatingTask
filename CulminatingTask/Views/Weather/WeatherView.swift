//
//  WeatherView.swift
//  CulminatingTask
//
//  Created by Brad Kang on 2021-03-23.
//

import SwiftUI

struct WeatherView: View {
    
    // Show the Add Event view
    @State var showAddEvent: Bool = false
    var body: some View {

        ScrollView {
            HStack {
                Spacer()
                Button("+") {
                    showAddEvent = true
                }
                .font(.title)
                .padding(.top, 20.0)
                .padding(.bottom, -50.0)
                .padding(.trailing, 15.0)
                .sheet(isPresented: $showAddEvent) {
                    AddCity(showThisView: $showAddEvent)
                }
            }
            WeatherTopHalf()
            Rectangle()
                .fill(Color.black)
                .frame(width: 320, height: 1)
            WeatherBottomHalf()
            Rectangle()
                .fill(Color.black)
                .frame(width: 320, height: 1)
            WeeklyForecast()
        }
        .background(Color(hue: 195/360, saturation: 0.3, brightness: 0.9))
        .ignoresSafeArea()
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
