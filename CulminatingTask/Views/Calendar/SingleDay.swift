//
//  SingleDay.swift
//  CulminatingTask
//
//  Created by Brad Kang on 2021-03-24.
//

import SwiftUI

struct SingleDay: View {
    
    @Binding var showThisView: Bool
    
    var body: some View {
        NavigationView {
            Text("Shows the events of the day")
                
            .navigationTitle("March 31, 2021")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Done") {
                        hideView()
                }
            }
        }
        }
    }
    
    func hideView() {
        return showThisView = false
    }
}

struct SingleDay_Previews: PreviewProvider {
    static var previews: some View {
        SingleDay(showThisView: .constant(true))
    }
}
