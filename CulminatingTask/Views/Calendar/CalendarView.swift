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
                    Text("28")
                }
                .padding(.all, -5.0)
                ZStack {
                    Rectangle()
                        .frame(width: 43, height: 55)
                        .foregroundColor(.green)
                        .border(Color(.black))
                    Text("1")
                }
                .padding(.all, -5.0)
                ZStack {
                    Rectangle()
                        .frame(width: 43, height: 55)
                        .foregroundColor(.green)
                        .border(Color(.black))
                    Text("2")
                }
                .padding(.all, -5.0)
                ZStack {
                    Rectangle()
                        .frame(width: 43, height: 55)
                        .foregroundColor(.green)
                        .border(Color(.black))
                    Text("3")
                }
                .padding(.all, -5.0)
                ZStack {
                    Rectangle()
                        .frame(width: 43, height: 55)
                        .foregroundColor(.green)
                        .border(Color(.black))
                    Text("4")
                }
                .padding(.all, -5.0)
                ZStack {
                    Rectangle()
                        .frame(width: 43, height: 55)
                        .foregroundColor(.green)
                        .border(Color(.black))
                    Text("5")
                }
                .padding(.all, -5.0)
                ZStack {
                    Rectangle()
                        .frame(width: 43, height: 55)
                        .foregroundColor(.green)
                        .border(Color(.black))
                    Text("6")
                }
                .padding(.all, -5.0)

            }
            .padding(.top, -15.0)
            HStack {
                ZStack {
                    Rectangle()
                        .frame(width: 43, height: 55)
                        .foregroundColor(.green)
                        .border(Color(.black))
                    Text("7")
                }
                .padding(.all, -5.0)
                ZStack {
                    Rectangle()
                        .frame(width: 43, height: 55)
                        .foregroundColor(.green)
                        .border(Color(.black))
                    Text("8")
                }
                .padding(.all, -5.0)
                ZStack {
                    Rectangle()
                        .frame(width: 43, height: 55)
                        .foregroundColor(.green)
                        .border(Color(.black))
                    Text("9")
                }
                .padding(.all, -5.0)
                ZStack {
                    Rectangle()
                        .frame(width: 43, height: 55)
                        .foregroundColor(.green)
                        .border(Color(.black))
                    Text("10")
                }
                .padding(.all, -5.0)
                ZStack {
                    Rectangle()
                        .frame(width: 43, height: 55)
                        .foregroundColor(.green)
                        .border(Color(.black))
                    Text("11")
                }
                .padding(.all, -5.0)
                ZStack {
                    Rectangle()
                        .frame(width: 43, height: 55)
                        .foregroundColor(.green)
                        .border(Color(.black))
                    Text("12")
                }
                .padding(.all, -5.0)
                ZStack {
                    Rectangle()
                        .frame(width: 43, height: 55)
                        .foregroundColor(.green)
                        .border(Color(.black))
                    Text("13")
                }
                .padding(.all, -5.0)

            }
            HStack {
                ZStack {
                    Rectangle()
                        .frame(width: 43, height: 55)
                        .foregroundColor(.green)
                        .border(Color(.black))
                    Text("14")
                }
                .padding(.all, -5.0)
                ZStack {
                    Rectangle()
                        .frame(width: 43, height: 55)
                        .foregroundColor(.green)
                        .border(Color(.black))
                    Text("15")
                }
                .padding(.all, -5.0)
                ZStack {
                    Rectangle()
                        .frame(width: 43, height: 55)
                        .foregroundColor(.green)
                        .border(Color(.black))
                    Text("16")
                }
                .padding(.all, -5.0)
                ZStack {
                    Rectangle()
                        .frame(width: 43, height: 55)
                        .foregroundColor(.green)
                        .border(Color(.black))
                    Text("17")
                }
                .padding(.all, -5.0)
                ZStack {
                    Rectangle()
                        .frame(width: 43, height: 55)
                        .foregroundColor(.green)
                        .border(Color(.black))
                    Text("18")
                }
                .padding(.all, -5.0)
                ZStack {
                    Rectangle()
                        .frame(width: 43, height: 55)
                        .foregroundColor(.green)
                        .border(Color(.black))
                    Text("19")
                }
                .padding(.all, -5.0)
                ZStack {
                    Rectangle()
                        .frame(width: 43, height: 55)
                        .foregroundColor(.green)
                        .border(Color(.black))
                    Text("20")
                }
                .padding(.all, -5.0)

            }
            HStack {
                ZStack {
                    Rectangle()
                        .frame(width: 43, height: 55)
                        .foregroundColor(.green)
                        .border(Color(.black))
                    Text("21")
                }
                .padding(.all, -5.0)
                ZStack {
                    Rectangle()
                        .frame(width: 43, height: 55)
                        .foregroundColor(.green)
                        .border(Color(.black))
                    Text("22")
                }
                .padding(.all, -5.0)
                ZStack {
                    Rectangle()
                        .frame(width: 43, height: 55)
                        .foregroundColor(.green)
                        .border(Color(.black))
                    Text("23")
                }
                .padding(.all, -5.0)
                ZStack {
                    Rectangle()
                        .frame(width: 43, height: 55)
                        .foregroundColor(.green)
                        .border(Color(.black))
                    Text("24")
                }
                .padding(.all, -5.0)
                ZStack {
                    Rectangle()
                        .frame(width: 43, height: 55)
                        .foregroundColor(.green)
                        .border(Color(.black))
                    Text("25")
                }
                .padding(.all, -5.0)
                ZStack {
                    Rectangle()
                        .frame(width: 43, height: 55)
                        .foregroundColor(.green)
                        .border(Color(.black))
                    Text("26")
                }
                .padding(.all, -5.0)
                ZStack {
                    Rectangle()
                        .frame(width: 43, height: 55)
                        .foregroundColor(.green)
                        .border(Color(.black))
                    Text("27")
                }
                .padding(.all, -5.0)

            }
            HStack {
                ZStack {
                    Rectangle()
                        .frame(width: 43, height: 55)
                        .foregroundColor(.green)
                        .border(Color(.black))
                    Text("28")
                }
                .padding(.all, -5.0)
                ZStack {
                    Rectangle()
                        .frame(width: 43, height: 55)
                        .foregroundColor(.green)
                        .border(Color(.black))
                    Text("29")
                }
                .padding(.all, -5.0)
                ZStack {
                    Rectangle()
                        .frame(width: 43, height: 55)
                        .foregroundColor(.green)
                        .border(Color(.black))
                    Text("30")
                }
                .padding(.all, -5.0)
                ZStack {
                    Rectangle()
                        .frame(width: 43, height: 55)
                        .foregroundColor(.green)
                        .border(Color(.black))
                    Text("31")
                }
                .padding(.all, -5.0)
                ZStack {
                    Rectangle()
                        .frame(width: 43, height: 55)
                        .foregroundColor(.green)
                        .border(Color(.black))
                    Text("1")
                }
                .padding(.all, -5.0)
                ZStack {
                    Rectangle()
                        .frame(width: 43, height: 55)
                        .foregroundColor(.green)
                        .border(Color(.black))
                    Text("2")
                }
                .padding(.all, -5.0)
                ZStack {
                    Rectangle()
                        .frame(width: 43, height: 55)
                        .foregroundColor(.green)
                        .border(Color(.black))
                    Text("3")
                }
                .padding(.all, -5.0)

            }
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
