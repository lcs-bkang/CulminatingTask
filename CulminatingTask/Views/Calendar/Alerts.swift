//
//  Alerts.swift
//  CulminatingTask
//
//  Created by Brad Kang on 2021-03-24.
//

import SwiftUI

struct Alerts: View {
    
    @Binding var showThisView: Bool
    
    var body: some View {
        NavigationView {
            
            Text("Alerts")
                .navigationTitle("Alerts")
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        Button("Done") {
                            hideView()
                    }
                }
            }
        }
    }
    
    // MARK: Functions
    func hideView() {
        return showThisView = false
    }
}

struct Alerts_Previews: PreviewProvider {
    static var previews: some View {
        Alerts(showThisView: .constant(true))
    }
}
