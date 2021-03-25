//
//  CalendarTopHalf.swift
//  CulminatingTask
//
//  Created by Brad Kang on 2021-03-24.
//

import SwiftUI

struct CalendarTopHalf: View {
    
    // Variable to hold the month
    @State var month: String = "March"
    
    // Variable to hold the year
    @State var year: String = "2021"
    
    var body: some View {
        VStack {
                Rectangle()
                .fill(Color.black)
                .frame(width: 320, height: 1)
            HStack {
                Text("\(month) \(year)")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding(.leading, 15.0)
                Spacer()
            }
    }
}
}
struct CalendarTopHalf_Previews: PreviewProvider {
    static var previews: some View {
        CalendarTopHalf()
    }
}
