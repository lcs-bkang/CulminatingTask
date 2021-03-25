//
//  WeatherView.swift
//  CulminatingTask
//
//  Created by Brad Kang on 2021-03-23.
//

import SwiftUI

struct WeatherView: View {
    var body: some View {

        ScrollView {
            Button("+") {
                
            }
            .padding(.top, 20.0)
            .padding(.bottom, -50.0)
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
