//
//  CalendarView.swift
//  CulminatingTask
//
//  Created by Brad Kang on 2021-03-23.
//

import SwiftUI

struct CalendarView: View {
    
    // MARK: Stored Properties
    @State var showAddEvent: Bool = false
    
    // MARK: Computed Properties
    
    var body: some View {
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
                AddEvent(showThisView: $showAddEvent, text: "")
            }
        }
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
