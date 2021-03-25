//
//  CalendarView.swift
//  CulminatingTask
//
//  Created by Brad Kang on 2021-03-23.
//

import SwiftUI

struct CalendarView: View {
    
    // MARK: Stored Properties
    
    // MARK: Computed Properties
    
    var body: some View {
        VStack {
            CalendarTopHalf()
            CalendarBottomHalf()
        }

    }
    
    // MARK: Functions
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
