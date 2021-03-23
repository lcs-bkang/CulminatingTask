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
            WeatherTopHalf()
            Rectangle()
                .fill(Color.black)
                .frame(width: 320, height: 1)
            WeatherBottomHalf()
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
