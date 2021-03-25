//
//  CalendarView.swift
//  CulminatingTask
//
//  Created by Brad Kang on 2021-03-23.
//

import SwiftUI

struct CalendarView: View {
    // MARK: Stored Properties
    
    // Variable to hold the month
    @State var month: String = "March"
    
    // MARK: Computed Properties
    
    var body: some View {
        
        VStack {
            Text(month)
            
            Rectangle()
                .fill(Color.black)
                .frame(width: 320, height: 1)
            Spacer()
            
        }
    }
    
    // MARK: Functions
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
