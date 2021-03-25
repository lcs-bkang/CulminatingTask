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
    
    @State var showAlerts: Bool = false
    
    // MARK: Computed Properties
    
    var body: some View {
        VStack {

        HStack {
            Button("Alerts") {
                showAlerts = true
            }
            .font(.title)
            .padding(.leading, 15.0)
            .sheet(isPresented: $showAlerts) {
                Alerts(showThisView: $showAlerts, text: "")
            }
            Spacer()
            Button("+") {
                showAddEvent = true
            }
            .font(.title)
            .padding(.trailing, 15.0)
            .sheet(isPresented: $showAddEvent) {
                AddEvent(showThisView: $showAddEvent, text: "")
            }
        }
            Rectangle()
            .fill(Color.black)
            .frame(width: 320, height: 1)
            
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
