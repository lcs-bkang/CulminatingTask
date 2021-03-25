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
    
    // Variable to hold the year
    @State var year: String = "2021"
    // MARK: Computed Properties
    
    var body: some View {
        
        VStack {
                Rectangle()
                .fill(Color.black)
                .frame(width: 320, height: 1)
            HStack {
                Text("\(month) \(year)")
                    .padding(.leading, 15.0)
                Spacer()
            }
            HStack {
                Text("S")
                    .frame(width: 43, height: 55)
                    .padding(.all, -5.0)
                Text("M")
                    .frame(width: 43, height: 55)
                    .padding(.all, -5.0)
                Text("T")
                    .frame(width: 43, height: 55)
                    .padding(.all, -5.0)
                Text("W")
                    .frame(width: 43, height: 55)
                    .padding(.all, -5.0)
                Text("T")
                    .frame(width: 43, height: 55)
                    .padding(.all, -5.0)
                Text("F")
                    .frame(width: 43, height: 55)
                    .padding(.all, -5.0)
                Text("S")
                    .frame(width: 43, height: 55)
                    .padding(.all, -5.0)
            }
            HStack {
                ZStack {
                    Rectangle()
                        .frame(width: 43, height: 55)
                        .foregroundColor(.green)
                        .border(Color(.black))
                    Text("Date")
                }
                .padding(.all, -5.0)
                ZStack {
                    Rectangle()
                        .frame(width: 43, height: 55)
                        .foregroundColor(.green)
                        .border(Color(.black))
                    Text("Date")
                }
                .padding(.all, -5.0)
                ZStack {
                    Rectangle()
                        .frame(width: 43, height: 55)
                        .foregroundColor(.green)
                        .border(Color(.black))
                    Text("Date")
                }
                .padding(.all, -5.0)
                ZStack {
                    Rectangle()
                        .frame(width: 43, height: 55)
                        .foregroundColor(.green)
                        .border(Color(.black))
                    Text("Date")
                }
                .padding(.all, -5.0)
                ZStack {
                    Rectangle()
                        .frame(width: 43, height: 55)
                        .foregroundColor(.green)
                        .border(Color(.black))
                    Text("Date")
                }
                .padding(.all, -5.0)
                ZStack {
                    Rectangle()
                        .frame(width: 43, height: 55)
                        .foregroundColor(.green)
                        .border(Color(.black))
                    Text("Date")
                }
                .padding(.all, -5.0)
                ZStack {
                    Rectangle()
                        .frame(width: 43, height: 55)
                        .foregroundColor(.green)
                        .border(Color(.black))
                    Text("Date")
                }
                .padding(.all, -5.0)

            }
            .padding(.top, -15.0)

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
